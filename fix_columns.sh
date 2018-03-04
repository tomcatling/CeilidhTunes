 cd ./abc

for tune in *.abc
do 
	echo "Fixing $tune" 

	# look for the first | to find where the tune starts
	tune_start=$(cat $tune | grep -n -m 1 '|' | sed 's/\([0-9]*\).*/\1/')

	# get the header
	header=$(head -n $(echo "$tune_start-1" | bc) $tune)

	# echo the header into a temporary file
	echo "$header" | tail -n +1 > "$tune.cols"

	# get the tune body
	tune_body=$(tail -n +"$tune_start" $tune)

	# process the body
	# 	replace any | with @|
	# 	remove excessive whitespace
	# 	columnise based on @, which will be removed
	# 	remove extra 2 spaces inserted before |
	# 	rearrange whitespace inserted between :|, |:, |] and ||
	# 	append to the temporary file, replace the old one
	echo "$tune_body" | sed 's/|/@|/g' \
	| sed 's/ * / /g' \
	| column -t -s'@' \
	| sed 's/  |/|/g' \
	| sed 's/:\( *\)|/\1:|/g' \
	| sed 's/|\( *\):/|:\1/g' \
	| sed 's/:\( *\)|/\1:|/g' \
	| sed 's/|\( *\)]/\1|]/g' \
	| sed 's/|\( *\)|/\1||/g' >> "$tune.cols" && mv "$tune.cols" $tune

done