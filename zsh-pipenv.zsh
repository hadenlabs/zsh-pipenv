#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install pipenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

# shellcheck disable=SC2034  # Unused variables left for readability
ZSH_PIPENV_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_PIPENV_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_PIPENV_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_PIPENV_PATH}"/pkg/main.zsh
