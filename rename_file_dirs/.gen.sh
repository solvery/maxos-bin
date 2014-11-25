#! /bin/sh

name_new=$1
if [ $name_new ]; then
	echo $name_new
else
	echo "miss arguement."
	exit 0
fi

git co -f -b $1
sh .rename_content.sh  $1
git ci -a -m "auto, rename_content."

python .rename_file_dir.py  $1
git add .
git ci -a -m "auto, rename filename."

#rm .gen.sh .rename_content.sh .rename_file_dir.py
#git ci -a -m "auto, remove generate script."

ls .rename_content.sh .rename_file_dir.py .gen.sh | xargs sed -i "s/pcard_adc_ctrl/$1/g"
git ci -a -m "auto, generate script can sub generate."
