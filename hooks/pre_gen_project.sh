#!/usr/bin/env Rscript
# -*- coding: utf-8 -*-

# Verifica se o nome do projeto é válido


MODULE_REGEX = '^[_a-zA-Z][_a-zA-Z0-9\-]+$'

module_name = "{{cookiecutter.project_slug}}"

match = grep(MODULE_REGEX,module_name, value = TRUE)

if(length(match) == 0) {
    print("ERROR: this is not a valid R project name!")
    quit(status = 1)
}
