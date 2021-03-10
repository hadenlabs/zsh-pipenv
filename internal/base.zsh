#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function pipenv::internal::pipenv::install {
    message_info "Installing ${PIPENV_PACKAGE_NAME}"
    if [ -x "$(command which pip3)" ]; then
        pip3 install --user "${PIPENV_PACKAGE_NAME}"
    fi
    pipenv::internal::pipenv::load
    message_success "Installed ${PIPENV_PACKAGE_NAME}"
}

function pipenv::internal::pipenv::load {
    if [ -x "$(command which pyenv)" ]; then
        export PIPENV_PYTHON="${PYENV_ROOT}/shims/python"
    fi
}

function pipenv::internal::pipenv::upgrade {
    message_info "command not implemented ${PIPENV_PACKAGE_NAME}"
}