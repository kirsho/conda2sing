#!/bin/bash

# script to create a conda env with apps in a singularity image 
# 1st argument is image name
# 2nd argument is env name
# 3rd arguments are app names. if more than one must be between quote
# and export env config in a yml file

SIMG=$1
DEFNAME=$2
APPS=$3

# download my definition file for singularity
# For easy push in shubn the definition file is named Singularity

wget https://raw.githubusercontent.com/kirsho/conda2sing/master/Singularity && \

sed -i -e "s/DEFNAME/$2/g" Singularity && \

sed -i -e "s/APPS/$3/g" Singularity && \

sudo singularity build $1.simg Singularity

