#!/usr/bin/env bats

@test "execution preserves an installed wrapped command and its arguments" {
  prepare_commands bats
  run "$BASH" "${BATS_TEST_DIRNAME%/*}/init.rc" bats "two words" "" "*.txt"
  [ "$status" -eq 17 ]
  [ "$output" = $'<two words>\n<>\n<*.txt>' ]
}

@test "execution supports installed commands outside the wrapper registry" {
  prepare_commands local-tool
  run "$BASH" "${BATS_TEST_DIRNAME%/*}/init.rc" local-tool "two words" "" "*.txt"
  [ "$status" -eq 17 ]
  [ "$output" = $'<two words>\n<>\n<*.txt>' ]
}

@test "sourcing preserves an installed wrapped command" {
  prepare_commands bats
  run "$BASH" -c 'source "$1" --setup; bats "two words" "" "*.txt"' \
    bash "${BATS_TEST_DIRNAME%/*}/init.rc"
  [ "$status" -eq 17 ]
  [ "$output" = $'<two words>\n<>\n<*.txt>' ]
}

prepare_commands() {
  local bin_dir="$BATS_TEST_TMPDIR/bin"
  mkdir -p "$bin_dir"
  printf '#!/usr/bin/env bash\nprintf "<%%s>\\n" "$@"\nexit 17\n' >"$bin_dir/$1"
  printf '#!/usr/bin/env bash\nexit 99\n' >"$bin_dir/curl"
  chmod +x "$bin_dir/$1" "$bin_dir/curl"
  export PATH="$bin_dir:$PATH"
}
