#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install pipenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

PACKAGE_NAME=pipenv

plugin_dir=$(dirname "${0}":A)

# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/messages.zsh

function pipenv::install {
    message_info "Installing ${PACKAGE_NAME}"
    if [ -x "$(command which pip3)" ]; then
        pip3 install --user ${PACKAGE_NAME}
    fi
    message_success "Installed ${PACKAGE_NAME}"
}

function pipenv::load {
    if [ -x "$(command which pyenv)" ]; then
        export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
    fi
    if [ -x "$(command which pipenv)" ]; then
        eval "$(pipenv --completion)"
    fi
}

function pipenv::dependences {
    message_info "Installing Dependences for ${PACKAGE_NAME}"
}

pipenv::load

if [ ! -x "$(command which pipenv)" ]; then
    pipenv::install
fi
