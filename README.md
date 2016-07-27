# About

This repository contains my personal dotfiles and vim config.
A fancy makefile allows me to use these dotfiles across different hosts.

# Makefile

The makefile makes it possible to specify host-specific settings in a dedicated folder.
These settings will be appended to the *global* settings once the makefile is invoked.
For instance, if I want to use `mvim` as my editor on my macbook (called Anduin), but not on any other machine, I add `export EDITOR=mvim` to `Anduin/zsh`.
Running `make zsh` afterwards will take care of merging the files and linking the resulting file to the correct directory.

## Future Work

The current system to create host specific settings is rather error prone and contains quite a lot of duplicate code.
Therefore, it would be nice if I could create a wrapper around this makefile in the future.
Ideally, such a wrapper would work based on a config file which contains the symlink destinations.

Furthermore, the following features could be handy:

* An override folder, which can be used to replace the global config file completely for certain hosts.
* An exclude folder, the contents of which would be added to the generated config, but not to git.
