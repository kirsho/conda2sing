Bootstrap: docker
From: continuumio/miniconda3

%help

This file is a singularity definition file to create simg with conda
It starts with a docker image of miniconda continuumio/miniconda3
It allows direct creation of the env by specifying in arguments of the condacreate2sig.sh script
1st arg is image name, 2nd is conda env name and 3rd are apps names (as an array, between " " eg "samtools fastqc, star")
App names shoulf be given as they are present in conda recepies

based on documentation https://singularity.lbl.gov/docs-recipes

%labels
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Maintainer Olivier Kirsh <olivier.kirsh@u-paris.fr>					
	Version v1.4 20200728
	Singularity 3.6.0 local & ifb

%setup
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mkdir -p ${SINGULARITY_ROOTFS}/setupfile


%files
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Singularity /setupfile/Singularity


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
	
	cd /setupfile							## FAIR infos
	/opt/conda/bin/conda list -n $defname > $defname_installed_packages.md
	/opt/conda/bin/conda env export --no-build -n $defname > $defname.yml

# set Conda in the PATH
#	echo "PATH definition"
#	defname=DEFNAME							## Set environment name
#	echo "export PATH=/opt/conda/envs/$defname/bin:$PATH"				## Put the environment in the PATH (no $ conda activate xx required)
	

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
