# This file is a modified version of:
# https://github.com/jackharrisonsherlock/common

# Original license:

# ==============================================================================
# MIT License

# Copyright (c) 2018 Jack Harrison-Sherlock

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# ==============================================================================

PROMPT='$(prompt)'
RPROMPT='$(rprompt)'

precmd() {
  local left="$(host) ❯ $(current_dir)"
  local right="$(git_status)"

  local invisible='%([BSUbfksu]|([FBK]|){*})'
  local left_length=${(%):-${(S)left//$~invisible}}
  local right_length=${(%):-${(S)right//$~invisible}}
  local width=$((COLUMNS-$#left_length-$#right_length))

  print -P $left${(l:$width:)}$right
}

prompt() {
  case $ZLE_MODE in
    (normal)
      echo -n "%F{green}[V]%f " ;;
    (*)
      echo -n "%F{red}❯❯❯%f " ;;
  esac
}

rprompt() {
  local error="%(?..%F{red}[!]%f)"
  local tasks="%(1j.%F{yellow}[&%j]%f.)"
  echo -n "$error$tasks"
}

host() {
  echo -n "%(!.%F{red}.%F{green})%n@%m%f"
}

current_dir() {
  echo -n "%F{blue}%~%f"
}

git_status() {
    local message=""
    local message_color="%F{green}"

    local staged=$(git status --porcelain 2>/dev/null | grep -e "^M " -e "^A ")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^ M" -e "^??")

    if [[ -n ${staged} ]]; then
        message_color="%F{red}"
    elif [[ -n ${unstaged} ]]; then
        message_color="%F{yellow}"
    fi

    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n ${branch} ]]; then
        message+="${message_color}${branch}%f"
    fi

    echo -n "${message}"
}

