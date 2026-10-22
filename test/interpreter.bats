#!/usr/bin/env bats

@test "bats wrapper ignores the login shell and preserves arguments" {
  run_wrapper bats bats
}

@test "recordr wrapper ignores the login shell and preserves arguments" {
  run_wrapper recordr recordr
}

@test "libguestfs wrapper ignores the login shell and preserves arguments" {
  run_wrapper libguestfs
}

run_wrapper() {
  local init_script="${BATS_TEST_DIRNAME%/*}/init.rc"
  run invoke_wrapper "$init_script" "$@"
  [ "$status" -eq 0 ]
  [ "$output" = $'<two words>\n<>\n<*.txt>' ]
}

invoke_wrapper() {
  export SHELL=/usr/bin/false
  curl() {
    printf '%s\n' ': "${BASH_VERSION:?expected Bash}"' 'printf "<%s>\n" "$@"'
  }
  source "$1" --setup
  shift
  "$@" "two words" "" "*.txt"
}
