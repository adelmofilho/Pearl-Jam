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

# Criação da virtualenv para R

verify_brefore_install("renv")

renv::init()

# Instalação de pacotes

pkgs <- c("usethis", "devtools", "testthat", "lintr")

renv::install(pkgs)

# Criação do diretório de testes

usethis::use_testthat()

# Licença de Uso

options(usethis.full_name = "{{cookiecutter.username}}")


if(tolower("{{cookiecutter.license}}")=="mit"){

 usethis::use_mit_license()

} else {


  usethis::use_gpl3_license()
}

# Inicialização do git

usethis::use_git(message = "Initial commit")

print("Execução de hooks concluida.")
