#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function pipenv::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_PIPENV_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_PIPENV_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_PIPENV_PATH}"/internal/linux.zsh
      ;;
    esac
}

pipenv::internal::main::factory

pipenv::internal::pipenv::load

if ! command -v pipenv > /dev/null; then pipenv::internal::pipenv::install; fi
