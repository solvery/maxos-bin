#! /bin/sh

name_old=$1
name_new=$2
if [ $name_new ]; then
	echo $name_new
else
	echo "miss arguement."
	exit 0
fi

sh .rename_content.sh $name_old $name_new

python .rename_file_dir.py  $name_old $name_new


