#!/usr/bin/env Rscript
# -*- coding: utf-8 -*-

# Instalação de pacotes

verify_brefore_install <- function(packnames){

  no_installed_pkgs <- packnames[!packnames %in% installed.packages()]

	if(length(no_installed_pkgs) > 0) {

	  install.packages(no_installed_pkgs, repos="https://cloud.r-project.org/")
	}
}

# 

verify_brefore_install("usethis")
print(getwd())
usethis::create_package(getwd())


# Criação da virtualenv para R

verify_brefore_install("renv")

renv::init()
