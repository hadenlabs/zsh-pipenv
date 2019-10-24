#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install pipenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

LIGHT_GREEN='\033[1;32m'
CLEAR='\033[0m'

function pipenv::install {
    if [[ $(uname) == 'Darwin' ]]; then
        # shellcheck source=/dev/null
        brew install pipenv
    else
        # shellcheck source=/dev/null
        sudo apt install pipenv
    fi
}

function pipenv::load {
    if [[ -x "$(command which pyenv)" ]]; then
        export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
    fi
    if [[ -x "$(command which pipenv)" ]]; then
        eval "$(pipenv --completion)"
    fi
}

function pipenv::dependences {
    pipenv::load
    echo -e "${CLEAR}${LIGHT_GREEN}Installing Dependences${CLEAR}"
}

pipenv::load

if [[ ! -x "$(command which pipenv)" ]]; then
    pipenv::install
fi
