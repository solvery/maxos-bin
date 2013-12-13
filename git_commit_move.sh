
file_src=$1
file_dst=$2

#mkdir -p $file_dst
cd $file_src
git log --reverse --oneline | sed 's/\ /\n\ /1' > .1
cd -

cat $file_src/.1 | while read line; do
#echo $line
	read line_commit
#echo $line_commit
	echo cd $file_src
	echo git co -f $line 
	echo cp -a $file_src\/\* $file_dst\/
	echo cd $file_dst
	echo git add -f .
	echo git ci -a -m \"$line_commit\"
	echo 
done
