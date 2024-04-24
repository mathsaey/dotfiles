# About

This repository contains my personal dotfiles and vim configuration.
These dotfiles are managed by [dotdrop](https://github.com/deadc0de6/dotdrop/).

To install:

- `pipx install dotdrop`
- Set up `bitwarden-cli` if machine needs access to sensitive info:
  - `bw config server https://<server url>`
  - `bw login`
  - `export BW_SESSION=<session key>`
- `~/.local/bin/dotdrop --cfg=~/.dotfiles/config.yaml install`
  - Use `-p <name>` if hostname is not set up correctly yet.
