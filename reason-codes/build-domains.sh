#!/usr/bin/env bash
# Generates one markdown file per domain from domains.tsv.
# Columns: sector <TAB> slug <TAB> title <TAB> code|class|use when ; code|class|use when ; ...
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$HERE/domains"
SRC="$HERE/domains.tsv"

find "$OUT" -name "*.md" -delete 2>/dev/null; mkdir -p "$OUT"

n=0
while IFS=$'\t' read -r sector slug title rows; do
  [ -z "${sector:-}" ] && continue
  [ "$sector" = "sector" ] && continue   # skip the header row
  case "$sector" in \#*) continue;; esac
  mkdir -p "$OUT/$sector"
  {
    printf '# %s\n\n' "$title"
    printf '**Sector:** %s\n\n' "$sector"
    printf '| `code` | `class` | Use when |\n|---|---|---|\n'
    printf '%s\n' "$rows" | tr ';' '\n' | while IFS='|' read -r c k u; do
      c="${c# }"; k="${k# }"; u="${u# }"
      [ -z "$c" ] && continue
      printf '| `%s` | `%s` | %s |\n' "$c" "$k" "$u"
    done
  } > "$OUT/$sector/$slug.md"
  n=$((n+1))
done < "$SRC"

# The flat reason_code -> reason_class mapping, one row per code.
# This is the file to load into a lookup table; the markdown is for reading.
MAP="$HERE/code-to-class.tsv"
{
  printf 'sector\tdomain\tcode\tclass\tuse_when\n'
  while IFS=$'\t' read -r sector slug title rows; do
    [ -z "${sector:-}" ] && continue
    [ "$sector" = "sector" ] && continue
    case "$sector" in \#*) continue;; esac
    printf '%s\n' "$rows" | tr ';' '\n' | while IFS='|' read -r c k u; do
      c="${c# }"; k="${k# }"; u="${u# }"
      [ -z "$c" ] && continue
      printf '%s\t%s\t%s\t%s\t%s\n' "$sector" "$slug" "$c" "$k" "$u"
    done
  done < "$SRC"
} > "$MAP"

echo "domains written: $n"
echo "sectors:         $(find "$OUT" -mindepth 1 -maxdepth 1 -type d | wc -l)"
echo "codes:           $(cat "$OUT"/*/*.md | grep '^| `' | grep -cv '^| `code`' )"
echo "mapping rows:    $(($(wc -l < "$MAP") - 1))  -> $(basename "$MAP")"
echo "distinct classes in the mapping: $(tail -n +2 "$MAP" | cut -f4 | sort -u | wc -l)"
