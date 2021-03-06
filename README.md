# tma-16

A 16-bit Virtual Machine and its toolchain, written for educational purposes by Dante Falzone, Romain Pesche, and Lance McDonald.

Assembler: v1.9

Instruction set: v1.3

[![CircleCI](https://circleci.com/gh/DanteFalzone0/tma-16/tree/master.svg?style=svg)](https://circleci.com/gh/DanteFalzone0/tma-16/tree/master)

The TMA-16 is a 16-bit Von Neumann machine, with a very limited instruction set (only 32 instructions!).
It was created both as a teaching tool, to help people visualize computation at the lowest level, as well as a learning
tool, to help the authors have a better grasp of low-level programming and a slightly easier Assembly language to practice with
than x86 Assembly.

You'll want to read `tma-16-rs/README.txt` for a list of options to pass to it.

This implementation, written in Rust, can run TMA-16 executables almost as fast as native machine code, but if you'd
like to be able to see what's going on you can slow down the execution. See `tma-16-rs/README.txt` for more details.

Building the machine (on *nix) is easy, provided your Rust toolchain is up-to-date:

  1. `cd tma-16-rs`

  2. `cargo build --release`

And that's it! The path to the executable is `tma-16-rs/target/release/tma-16-rs`. You can make an alias for it or move
it into `/usr/bin` for greater ease of use.

To use this virtual machine, do the following (assuming that `tma-16-rs` is in `/usr/bin` or is aliased):

  1. Use the .asm files in the directory /programs/ (or write your own programs in TMA-16 Assembly!)

  2. Assemble them with `python3 tma_16_assembler.py [file].asm`. Pass the option `-h` or `--hexdump` on the command line to see a
     hexdump of your assembled program.

  3. Run them with `tma-16-rs {file}.tmx [options]` (".tmx" is the extension for TMA-16 executables).

If you would like to make tweaks to the TMA-16, or write a new implementation of it, try running some of the provided programs
(especially test.asm) to make sure that whatever you're doing still conforms to the specification.

The TMA-16 has been partially ported to MinGW, but the MinGW implementation is very buggy.
