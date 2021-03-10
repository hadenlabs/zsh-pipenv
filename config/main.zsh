#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function pipenv::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_PIPENV_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_PIPENV_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_PIPENV_PATH}"/config/linux.zsh
      ;;
    esac
}

pipenv::config::main::factory