#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function pipenv::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_PIPENV_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_PIPENV_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_PIPENV_PATH}"/pkg/linux.zsh
      ;;
    esac

    # shellcheck source=/dev/null
    source "${ZSH_PIPENV_PATH}"/pkg/helper.zsh

    # shellcheck source=/dev/null
    source "${ZSH_PIPENV_PATH}"/pkg/alias.zsh
}

pipenv::pkg::main::factory
