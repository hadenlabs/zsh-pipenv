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
    if (( $+commands[pyenv] )); then
        export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
    fi
}

function pipenv::shell-activate {
    if (( ! $+commands[pipenv] )); then
        echo "Install http://docs.pipenv.org/en/latest/ to use this plugin." > /dev/stderr
        return 1
    fi

    if [ -e "$(pwd)/Pipfile" ]; then
        if [ ! "$PIPENV_ACTIVE" ] && [[ "${VIRTUAL_ENV}" != $(pipenv --venv) ]]; then
            echo -n "Pipfile exists. Do you want spawn a shell with the virtualenv? (y)"
            read answer
            if [[ "$answer" == "y" ]]; then
                cat Pipfile | grep python_version
                pipenv shell --fancy
            fi
        fi
    fi
}

function pipenv::dependences {
    pipenv::load
    echo -e "${CLEAR}${LIGHT_GREEN}Installing Dependences${CLEAR}"
}

pipenv::load

if (( ! $+commands[pipenv] )); then
    pipenv::install
    chpwd_functions+=(pipenv::shell-activate)
fi
