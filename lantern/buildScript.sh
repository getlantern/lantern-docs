#!/bin/bash

#Delete the build directory and recreate it to make sure sphinx-doc pulls in any updates to template files

DIR="html"

#Check that it exists before trying to delete

if [ -d "$DIR" ]
then
	rm -f -r $DIR
fi

#Add back the _build dir
mkdir $DIR

chmod a+rw $DIR

#Find all the directories that have an index.rst file and create a new subfolder under DIR
find . -name index.rst | xargs -I fPath dirname fPath | sed 's#\./##g' | xargs -I langDir mkdir -p $DIR/langDir

chmod -R a+rw $DIR

#Next run the build script for every directory that has and index.rst file and output the results to the 
#correct folder under build

find . -name index.rst | xargs -I fPath dirname fPath | sed 's#\./##g' | xargs -I langDir sphinx-build -b html langDir $DIR/langDir


