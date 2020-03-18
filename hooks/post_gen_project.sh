#!/usr/bin/env Rscript
# -*- coding: utf-8 -*-

# Instalação de pacotes 

verify_brefore_install <- function(packnames){
  
  no_installed_pkgs <- packnames[!packnames %in% installed.packages()]

	if(length(no_installed_pkgs) > 0) {
	  
	  install.packages(no_installed_pkgs, repos="https://cloud.r-project.org/")
	}
}

# Define licença do projeto

define_license <- function(license) {
  
  license_slug <- tolower(license)
  
  if (license_slug == "mit") {
    
    usethis::use_mit_license() 
    
  } else if (license_slug == "gpl3") {
    
    usethis::use_gpl3_license()
    
  } else {
    
    usethis::use_gpl3_license()
    
  }
}

verify_brefore_install("usethis")

define_license("({{cookiecutter.license}})")

  
# Criação da virtualenv para R

verify_brefore_install("renv")

renv::init()