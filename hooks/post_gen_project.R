#!/usr/bin/env Rscript
# -*- coding: utf-8 -*-


# Instalação do renv

verify_brefore_install <- function(packname){

	if(!packname %in% installed_packages()) install.packages(packname, repos="https://cloud.r-project.org/")

}

verify_brefore_install("renv")


# Criação da virtualenv para R

renv::init()
