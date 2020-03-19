#!/usr/bin/env Rscript
# -*- coding: utf-8 -*-

# Instalação de pacotes

verify_brefore_install <- function(packnames){

  no_installed_pkgs <- packnames[!packnames %in% installed.packages()]

	if(length(no_installed_pkgs) > 0) {

	  install.packages(no_installed_pkgs, repos="https://cloud.r-project.org/")
	}
}


# Criação do .lintr

verify_brefore_install(c("dplyr", "magrittr", "lintr"))

library(magrittr)
library(dplyr)

lintr::lint_package() %>%
    as.data.frame %>%
    group_by(linter) %>%
    tally(sort = TRUE) %$%
    sprintf("linters: with_defaults(\n    %s\n    dummy_linter = NULL\n  )\n",
            paste0(linter, " = NULL, # ", n, collapse = "\n    ")) %>%
    cat(file = ".lintr")

sprintf("exclusions: list(\n    %s\n  )\n",
        paste0('"', excluded_files, '"', collapse = ",\n    ")) %>%
    cat(file = ".lintr", append = TRUE)

# Criação da virtualenv para R

verify_brefore_install("renv")

renv::init()

# Instalação de pacotes

pkgs <- c("usethis", "devtools", "testthat", "lintr")

renv::install(pkgs)

# Criação do diretório de testes

usethis::use_testthat()


