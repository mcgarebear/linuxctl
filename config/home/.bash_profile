#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

main () {
  local -r __architecture=$(dpkg --print-architecture)
  local -r __file_path=$(realpath ${0})
  local -r __file_name=$(basename "${__file_path}")
  local -r __file_dir=$(dirname "${__file_path}")
  local -r __timestamp=$(date +"%Y%m%d-%H%M%S")

  [[ -f "${HOME}/.bashrc" ]] && source "${HOME}/.bashrc"

  shopt -s autocd
  shopt -s cdspell
  shopt -s checkwinsize
  shopt -s direxpand
  shopt -s dirspell
  shopt -s extglob
  shopt -s failglob
  shopt -s globstar
  shopt -s histappend
  shopt -s histreedit
  shopt -s histverify

  local -r config_dir=$(realpath "${__file_dir}/..")
  if ! [[ -d "${config_dir}" ]]; then
    return 0
  fi

  mkdir -p "${HOME}/bin"
  mkdir -p "${HOME}/.linuxctl"

  dotfiles=(
    'home/.prompt'
    'home/.path'
  )
  for dotfile in ${dotfiles[@]}; do
    local dotfile_path="${config_dir}/${dotfile}"
    [[ -f "${dotfile_path}" ]] && source "${dotfile_path}"
  done
}

main ${@}
