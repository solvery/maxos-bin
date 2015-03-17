
import os
import os.path
import re
import sys

name_old = sys.argv[1]
name_new = sys.argv[2]

def modify( path ):
	os.chdir( path )
	for dir_or_file in os.listdir( path ):
		if (re.match(r".git", dir_or_file)):
			print "skip .git"
		elif (os.path.islink(dir_or_file)):
			print "skip link"
		else:
			if os.path.isdir( dir_or_file ):
				modify( os.getcwd() + '/' + dir_or_file )
				os.chdir( '..' )
				if (re.match(name_old, dir_or_file)): 
					dir_name = re.sub(name_old, name_new , dir_or_file )
					os.rename( dir_or_file , dir_name )
					print ("%s %s" % (dir_or_file, dir_name))
			else:
				if (re.match(name_old, dir_or_file)): 
					file_name = re.sub(name_old, name_new , dir_or_file )
					os.rename( dir_or_file , file_name )	
					print ("%s %s" % (dir_or_file, file_name))
if __name__ == '__main__':
	cur_dir = os.getcwd();
	print cur_dir
	modify( cur_dir )

