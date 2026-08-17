#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/get-properties.sh
#   {"success":true,"data":"name: My Document\npath: ...\nmodified: ...\npassword protected: false"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0")" >&2; }

main() {
  run_backend document get-properties "$@"
}

main "$@"