Bootstrap: docker
From: continuumio/miniconda3

%help

This file is a singularity definition file to create simg with conda
It starts with a docker image of miniconda continuumio/miniconda3
It allows direct creation of the env by specifying which package (or with a .yml file)
unlock desired method by removing # and set variable (defname) or file name (xxxx.yml) 
future dev: if else, yml or package names as argument for $ singularity build command
Image build with ($ sudo singularity build imagename.simg Singularity )
based on documentation https://singularity.lbl.gov/docs-recipes

%labels
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Maintainer Olivier Kirsh <olivier.kirsh@u-paris.fr>					
	Version v1.4 20200724
	Singularity 3.6.0 local & ifb


%post
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# What is executed during the build process

# set Conda in the PATH
	echo "PATH definition"
	echo "defname=DEFNAME"	

# Edit .bashrc to run conda    	
	echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc		## Enable conda for the current user
									## Better than $ echo "conda activate" >> ~/.bashrc
									## or $ export PATH="/opt/miniconda3/bin:$PATH" (not recommanded)

# Set conda channels 
	/opt/conda/bin/conda config --add channels defaults
	/opt/conda/bin/conda config --add channels bioconda
	/opt/conda/bin/conda config --add channels conda-forge


# Update conda
	/opt/conda/bin/conda update -n base conda  			## Optionnal. Or specify version


# Conda install
	defname=DEFNAME 						## Set environment name
	/opt/conda/bin/conda create -n $defname APPS			## package name or python version. 
	/opt/conda/bin/conda clean --tarballs				## Clean and light weight env
	mkdir -p /setupfile						## Create /setupfile directory to save and trace env recipe
	mv Singularity /setupfile
	cd /setupfile
	/opt/conda/bin/conda list -n $defname > $defname_installed_packages.md
	/opt/conda/bin/conda env export --no-build -n $defname > $defname.yml

# set Conda in the PATH
	echo "PATH definition"
	defname=DEFNAME							## Set environment name
	echo "export PATH=/opt/conda/envs/$defname/bin:$PATH"				## Put the environment in the PATH (no $ conda activate xx required)
	

%environment
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# set Conda in the PATH
	echo "conda activate"
	defname=DEFNAME	
	export PATH=/opt/conda/envs/$defname/bin:$PATH						## Set environment name
	
	
%runscript
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This executes commands
	echo "image startup"
    	exec echo "$@"
