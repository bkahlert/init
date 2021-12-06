#!/usr/bin/env bats

# TODO -h
# TODO --help
@test "should display help by default" {

   ▔▔▔▔▔▔▔ INIT.RC 0.1.0

   Usage: init.rc COMMAND [ARGS...]

   Commands:
     bats | batsw             Run Bats (Bash Automated Testing System) tests
     recordr | recordrw       Record terminal sessions and convert them to SVG
     base32                   Transform data into printable data
     base64                   Transform data into printable data
     bash                     GNU Bourne-Again SHell
     guestfish                The guest filesystem shell
     guestmount               Mount a guest filesystem on the host using FUSE and libguestfs
     guestunmount             Unmount a guestmounted filesystem
     virt-alignment-scan      Check alignment of virtual machine partitions
     virt-builder             Build virtual machine images quickly
     virt-builder-repository  Build virt-builder source repository easily
     virt-cat                 Display files in a virtual machine
     virt-copy-in             Copy files and directories into a virtual machine disk image
     virt-copy-out            Copy files and directories out of a virtual machine disk image
     virt-customize           Customize a virtual machine
     virt-df                  Display free space on virtual filesystems
     virt-dib                 Run diskimage-builder elements
     virt-diff                Differences between files in two virtual machines
     virt-edit                Edit a file in a virtual machine
     virt-filesystems         List filesystems, partitions, block devices, LVM in a virtual machine or disk image
     virt-format              Erase and make a blank disk
     virt-get-kernel          Extract kernel and ramdisk from guests
     virt-index-validate      Validate virt-builder index file
     virt-inspector           Display operating system version and other information about a virtual machine
     virt-list-filesystems    List filesystems in a virtual machine or disk image
     virt-list-partitions     List partitions in a virtual machine or disk image
     virt-log                 Display log files from a virtual machine
     virt-ls                  List files in a virtual machine
     virt-make-fs             Make a filesystem from a tar archive or files
     virt-p2v-make-disk       Build the virt-p2v disk using virt-builder
     virt-p2v-make-kickstart  Build the virt-p2v kickstart
     virt-p2v-make-kiwi       Build the virt-p2v kiwi configuration
     virt-rescue              Run a rescue shell on a virtual machine
     virt-resize              Resize a virtual machine disk
     virt-sparsify            Make a virtual machine disk sparse
     virt-sysprep             Reset, unconfigure or customize a virtual machine so clones can be made
     virt-tail                Follow (tail) files in a virtual machine
     virt-tar                 Extract or upload files to a virtual machine
     virt-tar-in              Unpack a tarball into a virtual machine disk image
     virt-tar-out             Pack a virtual machine disk image directory into a tarball
     virt-v2v                 Convert a guest to use KVM
     virt-v2v-copy-to-local   Copy a remote guest to the local machine
     virt-win-reg             Export and merge Windows Registry entries from a Windows guest
}

# TODO bats
# TODO recordr
# TODO virt-customize
# TODO 5x scripts

# TODO rec demos
