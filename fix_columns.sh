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
	# 	first replace any | with @|
	# 	then remove excessive whitespace
	# 	then columnise based on @, which will be removed
	# 	then rearrange whitespace inserted between :|, |:, |] and ||
	echo "$tune_body" | sed 's/|/@|/g' \
	| sed 's/ * / /g' \
	| column -t -s'@' \
	| sed 's/:\( *\)|/\1:|/g' \
	| sed 's/|\( *\):/|:\1/g' \
	| sed 's/:\( *\)|/\1:|/g' \
	| sed 's/|\( *\)]/\1|]/g' \
	| sed 's/|\( *\)|/\1||/g' >> "$tune.cols" && mv "$tune.cols" $tune

done