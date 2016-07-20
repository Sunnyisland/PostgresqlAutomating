#!/bin/bash

dbname="vando"
username="vando"
SCHEMA="movies"
function loop() {
for d in "$1"/*; do 
	echo "folder is $d and pwd is $PWD"
	cur_dir="$PWD"
	cp movies_db.sql $d
	cp movies_data.sql $d
	cp testcases.sql $d
	cp postgresql_single.sql $d
 	cd $d
	
	psql $dbname $username <<EOF
	\i movies_db.sql
	\i movies_data.sql
	\i h7.sql
	\i testcases.sql
	\i postgresql_single.sql
	SELECT db_to_csv('$d');
	SELECT view_to_csv('$d');
	
EOF
	rm movies_db.sql
	rm movies_data.sql
	#rm testcases.sql
	rm postgresql_single.sql
	for filename in *.csv; do
		echo "$filename"
		cat "${filename}"
		echo
	done > out
	cd "$cur_dir"
	echo "pwd is $PWD"
	
	#break;
done
}

loop "$PWD/HW7_c5dothih"


