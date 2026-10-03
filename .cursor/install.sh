#!/usr/bin/env bash
set -euo pipefail

# Validate repository checkout
test -f README.md

# Verify core development toolchains are available on PATH
for tool in git python3 node go rustc javac gcc; do
  command -v "$tool" >/dev/null
done

echo "DFSl development environment ready"
