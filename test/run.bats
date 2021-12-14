#!/usr/bin/env bats

init.rc() {
  bash "$BATS_CWD/init.rc" "$@"
}

# Prints a Bats test with the specified name and the contents of the specified
# file as its content.
# Arguments:
#   1 - file name; use `-` to read from STDIN (default: -)
bats_test() {
  echo '#!/usr/bin/env bats'
  echo '@te''st "test--'"$(random_string 4)"'" {'
  cat -
  echo '}'
}

@test "should run if downloaded" {
  run bash -c 'curl -LfsS https://git.io/init.rc | "$SHELL" -s -- bash -c "echo \"Hello World!\""'
  assert_output --partial "Hello World!"
}
@test "should run if executed locally" {
  run init.rc bash -c 'echo "Hello World!"'
  assert_output --partial "Hello World!"
}

@test "should display help if executed" {
  run init.rc
  assert_line --partial '▔▔▔▔▔▔▔ INIT.RC 0.1.0'
  assert_line --partial 'Usage: curl -LfsS https://git.io/init.rc | "$SHELL" -s -- COMMAND [ARGS...]'
  assert_line --regexp 'guestfish [[:space:]]* The guest filesystem shell'
}
@test "should display help on -h" {
  run init.rc -h
  assert_line --partial 'Usage: curl -LfsS https://git.io/init.rc | "$SHELL" -s -- COMMAND [ARGS...]'
}
@test "should display help on --help" {
  run init.rc --help
  assert_line --partial 'Usage: curl -LfsS https://git.io/init.rc | "$SHELL" -s -- COMMAND [ARGS...]'
}

@test "should run bash" {
  bats_test <<<'run echo "foo"; assert_output "foo"' >test.bats
  run init.rc bash -c 'echo "Hello World!"'
  assert_output --partial 'Hello World!'
}

@test "should run base32" {
  echo 'Hello World!' >hello
  run init.rc base32 hello
  assert_output --partial 'JBS''WY3DPE''BLW64TMM''QQQ''U==='
}

@test "should run base64" {
  echo 'Hello World!' >hello
  run init.rc base64 hello
  assert_output --partial 'SGVsbG8gV29ybGQhCg=='
}

@test "should run bats" {
  bats_test <<<'run echo "foo"; assert_output "foo"' >test.bats
  run init.rc bats .
  assert_output --regexp '▶▶ TEST RUN
 ℹ working directory: .*
 ℹ bats command line: bats --jobs [0-9]+ --no-parallelize-within-files --recursive --timing --no-tempdir-cleanup .
1..1
ok 1 test--[A-Za-z0-9]+ in [0-9]+ms'
}

@test "should run recordr" {
  mkdir -p rec && echo 'echo "Hello World!"' >rec/hello.rec
  run init.rc recordr
  assert_line --partial '● RECORDING: rec/hello.rec'
  assert_file_exist docs/hello.svg
}

@test "should run libguestfs" {
  local binaries=('guestfish' 'guest'""'mount' 'guest'""'unmount' 'virt-alignment-scan' 'virt-builder' 'virt-builder-repository' 'virt-cat' 'virt-copy-in'
    'virt-copy-out' 'virt-customize' 'virt-df' 'virt-dib' 'virt-diff' 'virt-edit' 'virt-filesystems' 'virt-format' 'virt-get-kernel' 'virt-index-validate'
    'virt-inspector' 'virt-list-filesystems' 'virt-list-partitions' 'virt-log' 'virt-ls' 'virt-make-fs' 'virt-p2v-make-disk' 'virt-p2v-make-kickstart'
    'virt-p2v-make-kiwi' 'virt-rescue' 'virt-resize' 'virt-spars'""'ify' 'virt-sysprep' 'virt-tail' 'virt-tar' 'virt-tar-in' 'virt-tar-out' 'virt-v2v'
    'virt-v2v-copy-to-local' 'virt-win-reg')
  for binary in "${binaries[@]}"; do
    run init.rc "$binary" --version
    assert_output --partial "1.4"
  done
}
