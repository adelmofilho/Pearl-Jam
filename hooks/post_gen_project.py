#!/usr/bin/env R
# -*- coding: utf-8 -*-

InsPack <- function(pack) { if (!pack %in% installed.packages()) { print(paste("installing",pack)) install.packages(pack) } else print(paste(pack," already installed")) }

InsPack("renv")
