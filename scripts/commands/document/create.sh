#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/create.sh "My Document"
#   {"success":true,"data":"created"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") [initial-text]" >&2; }

main() {
  run_backend document create "$@"
}

main "$@"