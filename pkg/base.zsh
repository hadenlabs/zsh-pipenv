#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function pipenv::install {
    pipenv::internal::pipenv::install
}

function pipenv::load {
    pipenv::internal::pipenv::load
}

function pipenv::upgrade {
    pipenv::internal::pipenv::upgrade
}
