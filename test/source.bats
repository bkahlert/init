#!/usr/bin/env bats

setup() {
  # shellcheck source=../init.rc
  source "$BATS_CWD/init.rc"
}

@test "should run existing binary" {
  run base64 <<<'Hello World!' # fails if delegated to Docker based wrapper as here string wouldn't get correctly passed
  assert_output --partial 'SGVsbG8gV29ybGQhCg=='
}

@test "should run binary wrapped by single-binary wrapper" {
  run batsw --version
  assert_line --regexp 'Bats [0-9]+.[0-9]+'
}

@test "should run binary wrapped by multi-binary wrapper" {
  run guestfish --version
  assert_line --regexp 'guestfish [0-9]+.[0-9]+'
}
