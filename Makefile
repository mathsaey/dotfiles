# Makefile
# Mathijs Saey

# This makefile creates the required symlinks for a given target

# ------- #
# Globals #
# ------- #

DOTFILES := $(shell pwd)
UNAME    := $(shell uname)
BUILD    := build

# --------- #
# Functions #
# --------- #

build  = $(DOTFILES)/$(BUILD)/$(1)

# ------------------ #
# Determine Hostname #
# ------------------ #

ifeq ($(UNAME), Linux)
	HOSTNAME := $(shell hostname)
endif
ifeq ($(UNAME), Darwin)
	HOSTNAME := $(shell scutil --get ComputerName)
endif

# ------- #
# Targets #
# ------- #

all: bash zsh tmux ssh git vim
clean: clean-bash clean-zsh clean-tmux clean-ssh clean-git clean-vim

bash: clean-bash $(HOME)/.bashrc $(HOME)/.bash_profile
$(HOME)/.bashrc: $(call build,bash)
	ln -s $< $@
$(HOME)/.bash_profile: $(call build,bash)
	ln -s $< $@
clean-bash:
	- rm $(HOME)/.bashrc
	- rm $(HOME)/.bash_profile

zsh: clean-zsh $(HOME)/.zshrc
$(HOME)/.zshrc: $(call build,zsh)
	ln -s $< $@
clean-zsh:
	- rm $(HOME)/.zshrc

tmux: clean-tmux $(HOME)/.tmux.conf
$(HOME)/.tmux.conf: $(call build,tmux)
	ln -s $< $@
clean-tmux:
	- rm $(HOME)/.tmux.conf

ssh: clean-ssh $(HOME)/.ssh/config
$(HOME)/.ssh/config: $(call build,ssh)
	mkdir -p $(dir $@)
	ln -s $< $@
clean-ssh:
	- rm $(HOME)/.ssh/config

git: clean-git $(HOME)/.gitconfig
$(HOME)/.gitconfig: $(call build,gitconfig)
	ln -s $< $@
clean-git:
	- rm $(HOME)/.gitconfig

vim: clean-vim
	cd vim ; ./setup.sh
clean-vim:
	 - cd vim ; ./clean.sh

.PHONY: vim
.PHONY: all
.PHONY: clean
.PHONY: bash
.PHONY: clean-bash
.PHONY: zsh
.PHONY: clean-zsh
.PHONY: tmux
.PHONY: clean-tmux
.PHONY: ssh
.PHONY: clean-ssh
.PHONY: git
.PHONY: clean-git

# ---------------------- #
# Host-specific Settings #
# ---------------------- #

$(DOTFILES)/$(BUILD)/% : $(DOTFILES)/% $(DOTFILES)/$(HOSTNAME)/%
	mkdir -p $(dir $@)
	cat $^ > $@
$(DOTFILES)/$(BUILD)/% : $(DOTFILES)/%
	mkdir -p $(dir $@)
	ln -s $< $@

