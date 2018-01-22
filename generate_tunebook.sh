#!/usr/local/bin/bash

transpose="0"
if [ -n "$1" ]
then
	transpose=$1
fi

echo "Transposing by $transpose semitones."


declare -A sets; declare -a keys;

# dashing white sergeant
sets["Dashing_White_Sergeant"]="Dashing_White_Sergeant"; 
keys+=( "Dashing_White_Sergeant" )
sets["Petronella"]="Dashing_White_Sergeant"; 
keys+=( "Petronella" )
sets["Ceilidh_Band_Reel"]="Dashing_White_Sergeant"; 
keys+=( "Ceilidh_Band_Reel" )

# from the new country
sets["From_The_New_Country"]="From_The_New_Country"; 
keys+=( "From_The_New_Country" )
sets["The_Blackthorn_Stick"]="From_The_New_Country"; 
keys+=( "The_Blackthorn_Stick" )
sets["Irish_Washerwoman"]="From_The_New_Country"; 
keys+=( "Irish_Washerwoman" )

# king of the fairies
sets["King_of_the_Fairies"]="King_of_the_Fairies"; 
keys+=( "King_of_the_Fairies" )
sets["Red_Haired_Boy"]="King_of_the_Fairies"; 
keys+=( "Red_Haired_Boy" )
sets["Harvest_Home"]="King_of_the_Fairies"; 
keys+=( "Harvest_Home" )

# Maggies_Pancakes
sets["Maggies_Pancakes"]="Maggies_Pancakes"; 
keys+=( "Maggies_Pancakes" )
sets["The_Otters_Holt"]="Maggies_Pancakes"; 
keys+=( "The_Otters_Holt" )
sets["Hulls_Reel"]="Maggies_Pancakes"; 
keys+=( "Hulls_Reel" )
sets["MacArthur_Road"]="Maggies_Pancakes"; 
keys+=( "MacArthur_Road" )

# zycanthos
sets["Zycanthos"]="Zycanthos"; 
keys+=( "Zycanthos" )
sets["Jig_in_A"]="Zycanthos"; 
keys+=( "Jig_in_A" )
sets["The_Peelers_Away_With_My_Daughter"]="Zycanthos"; 
keys+=( "The_Peelers_Away_With_My_Daughter" )

# Irish Reels
sets["Cooleys"]="Irish_Reels"; 
keys+=( "Cooleys" )
sets["The_Drunken_Landlady"]="Irish_Reels"; 
keys+=( "The_Drunken_Landlady" )
sets["Toss_The_Feathers"]="Irish_Reels"; 
keys+=( "Toss_The_Feathers" )
sets["Drowsy_Maggie"]="Irish_Reels"; 
keys+=( "Drowsy_Maggie" )
sets["Hand_Me_Down_The_Tackle"]="Irish_Reels"; 
keys+=( "Hand_Me_Down_The_Tackle" )

# Waltzes
sets["Flatbush"]="Waltzes"; 
keys+=( "Flatbush" )
sets["Forest_Flowers"]="Waltzes"; 
keys+=( "Forest_Flowers" )
sets["Margarets"]="Waltzes"; 
keys+=( "Margarets" )
sets["The_Dark_Island"]="Waltzes"; 
keys+=( "The_Dark_Island" )
sets["Ashokan_Farewell"]="Waltzes"; 
keys+=( "Ashokan_Farewell" )


# Airs
sets["Tune_For_Dad"]="Airs"; 
keys+=( "Tune_For_Dad" )
sets["Captain_OKane"]="Airs"; 
keys+=( "Captain_OKane" )
sets["Si_Beag_Si_Mor"]="Airs"; 
keys+=( "Si_Beag_Si_Mor" )
sets["Carolans_Farewell"]="Airs"; 
keys+=( "Carolans_Farewell" )

cd ./abc
for set in "${sets[@]}"
do
	echo "" > "$set.tex" # create/clear all of the set files
done


for tune in "${keys[@]}"
do 

	if [ -f "$tune.abc" ]
    then
		
		echo "\begin{abc}[name=$tune]" >> "${sets[$tune]}.tex"
		abc2abc "$tune.abc" -e -t "$transpose" >> "${sets[$tune]}.tex" # add each tune to its set in order, surrounded by the LaTeX strings
		echo "\end{abc}" >> "${sets[$tune]}.tex"
		echo "" >> "${sets[$tune]}.tex"
		
	else
	   echo "Can't find $tune.abc!"
	   exit 1
	fi
		
done

mv *.tex ../tex/



cd ../tex/
echo "First LaTeX run."
pdflatex --shell-escape build.tex &>/dev/null
echo "Second LaTeX run."
pdflatex --shell-escape build.tex &>/dev/null
cp build.pdf ../tunebook_new.pdf
echo "Done."