#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONTENT_DIR="${SCRIPT_DIR}/../references/wiki/content"

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <search-term> [subpath]"
    echo "Example: $0 'window_rule' configuring/core/rules"
    exit 1
fi

QUERY="$1"
SEARCH_PATH="${2:-}"

if [ -n "${SEARCH_PATH}" ]; then
    TARGET="${CONTENT_DIR}/${SEARCH_PATH}"
else
    TARGET="${CONTENT_DIR}"
fi

if ! [ -d "${CONTENT_DIR}" ]; then
    echo "Wiki content directory not found. Cloning wiki on first run..."
    "${SCRIPT_DIR}/update-wiki.sh"
fi

grep -rnI -i -C 2 "${QUERY}" "${TARGET}" || {
    echo "No direct matches found for '${QUERY}'. Finding related files by name:"
    find "${TARGET}" -iname "*${QUERY}*"
}
