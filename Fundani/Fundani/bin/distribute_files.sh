#!/bin/sh

#  Matthias Strubel (c) 2014  - GPL3
#   matthias.strubel@aod-rpg.de
#
# This script distributes a set of files into $1 folder

#Script for single stuff
Fundani_FOLDER=$4
Fundani_FOLDER=${Fundani_FOLDER:=/opt/Fundani}
script=$Fundani_FOLDER/bin/distribute_file_into_directory.sh


# To enable DEBUG mode, run the following line before startint this script
#   export DEBUG=true
DEBUG=${DEBUG:=false}

work_on_file() {
  local destination_root_folder=$1
  local src_file=$2

  find $destination_root_folder -type d -exec $script "{}"  $src_file $overwrite ';'

}



#-------------

destination=$1
overwrite=$2
overwrite=${overwrite:=false}
src_file=$3
src_file=${src_file:="all"}

$DEBUG && echo "parameters:
  destination $destination
  overwrite $overwrite
  src_file $src_file
  Fundani_folder=$Fundani_FOLDER
  call script: $script
 ";

if [ "$src_file" = "all" ] ; then
	work_on_file $destination $Fundani_FOLDER/src/HEADER.txt
	work_on_file $destination $Fundani_FOLDER/src/README.txt
else
	work_on_file $destination $src_file
fi
