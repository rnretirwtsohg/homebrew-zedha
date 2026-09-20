#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
test_root=$(mktemp -d)
trap 'rm -rf "$test_root"' EXIT

cask="$test_root/zedha.rb"
cat > "$cask" <<'RUBY'
cask "zedha" do
  version "1.12.0-zedha.1"
  sha256 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
end
RUBY

new_sha=bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bash "$repo_root/scripts/update-cask" 1.20.2-zedha.1 "$new_sha" "$cask"
grep -Fq 'version "1.20.2-zedha.1"' "$cask"
grep -Fq "sha256 \"$new_sha\"" "$cask"

before=$(shasum -a 256 "$cask")
bash "$repo_root/scripts/update-cask" 1.20.2-zedha.1 "$new_sha" "$cask"
after=$(shasum -a 256 "$cask")
[[ "$before" == "$after" ]]

bash "$repo_root/scripts/update-cask" 1.19.0-zedha.1 \
  cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc "$cask"
grep -Fq 'version "1.20.2-zedha.1"' "$cask"

echo "All cask updater tests passed"
