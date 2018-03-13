#!/usr/local/bin/bash

transpose="0"
if [ -n "$1" ]
then
	transpose=$1
fi

echo "Transposing by $transpose semitones."

# 'sets' is an associative array/dictionary to store a set name for each tune
# 'keys' is a normal array storing the name of each tune in the order they should be processed
# associative arrays are not stored in order so this is necessary to determine tune order within sets.
declare -A sets; declare -a keys;

# dashing white sergeant
sets["Dashing_White_Sergeant"]="Dashing_White_Sergeant"; 	# sets["TUNE_NAME"]="SET_NAME";
keys+=( "Dashing_White_Sergeant" )							# keys+=( "SET_NAME" )
sets["Petronella"]="Dashing_White_Sergeant"; 
keys+=( "Petronella" )
sets["Ceilidh_Band_Reel"]="Dashing_White_Sergeant"; 
keys+=( "Ceilidh_Band_Reel" )

# scottish reels
sets["Mrs_Mccleod"]="Scottish_Reels"; 
keys+=( "Mrs_Mccleod" )
sets["Fairy_Dance"]="Scottish_Reels"; 
keys+=( "Fairy_Dance" )
sets["Staten_Island"]="Scottish_Reels"; 
keys+=( "Staten_Island" )
sets["High_Road_To_Linton"]="Scottish_Reels"; 
keys+=( "High_Road_To_Linton" )
sets["Masons_Apron"]="Scottish_Reels"; 
keys+=( "Masons_Apron" )

# congress
sets["Prince_Of_Wales"]="Congress";
keys+=( "Prince_Of_Wales" )
sets["The_Congress_Reel"]="Congress"; 
keys+=( "The_Congress_Reel" )
sets["Elzics_Farewell"]="Congress"; 
keys+=( "Elzics_Farewell" )
sets["Jack_Broons_70th"]="Congress"; 
keys+=( "Jack_Broons_70th" )

# from the new country
sets["From_The_New_Country"]="From_The_New_Country"; 
keys+=( "From_The_New_Country" )
sets["The_Blackthorn_Stick"]="From_The_New_Country"; 
keys+=( "The_Blackthorn_Stick" )
sets["Irish_Washerwoman"]="From_The_New_Country"; 
keys+=( "Irish_Washerwoman" )

# irish jigs
sets["Lark_In_The_Morning"]="Irish_Jigs"; 
keys+=( "Lark_In_The_Morning" )
sets["Lilting_Banshee"]="Irish_Jigs"; 
keys+=( "Lilting_Banshee" )
sets["Connaught_Mans_Rambles"]="Irish_Jigs"; 
keys+=( "Connaught_Mans_Rambles" )
sets["The_Kesh"]="Irish_Jigs"; 
keys+=( "The_Kesh" )

# slip jigs
sets["The_Butterfly"]="Slip_Jigs"; 
keys+=( "The_Butterfly" )
sets["Dublin_Streets"]="Slip_Jigs"; 
keys+=( "Dublin_Streets" )
sets["Barney_Brannigan"]="Slip_Jigs"; 
keys+=( "Barney_Brannigan" )
sets["Sir_Roger_De_Coverley"]="Slip_Jigs"; 
keys+=( "Sir_Roger_De_Coverley" )
sets["The_Peacock_Followed_The_Hen"]="Slip_Jigs"; 
keys+=( "The_Peacock_Followed_The_Hen" )
sets["Fox_Hunters_Jig"]="Slip_Jigs"; 
keys+=( "Fox_Hunters_Jig" )

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

# Flatbush Set
#sets["Flatbush"]="Flatbush_Set"; 
#keys+=( "Flatbush" )
#sets["Forest_Flowers"]="Flatbush_Set"; 
#keys+=( "Forest_Flowers" )

# Margarets Set
#sets["My_Cape_Breton_Home"]="Margarets_Set"; 
#keys+=( "My_Cape_Breton_Home" )
#sets["Margarets"]="Margarets_Set"; 
#keys+=( "Margarets" )

# Waltzes
sets["The_Dark_Island"]="Waltzes"; 
keys+=( "The_Dark_Island" )
sets["Ashokan_Farewell"]="Waltzes"; 
keys+=( "Ashokan_Farewell" )
sets["Carolans_Welcome"]="Waltzes"; 
keys+=( "Carolans_Welcome" )
sets["Margarets"]="Waltzes"; 
keys+=( "Margarets" )
sets["Captain_OKane"]="Waltzes"; 
keys+=( "Captain_OKane" )
sets["Flatbush"]="Waltzes"; 
keys+=( "Flatbush" )
sets["Forest_Flowers"]="Waltzes"; 
keys+=( "Forest_Flowers" )



# Airs
sets["Tune_For_Dad"]="Airs"; 
keys+=( "Tune_For_Dad" )
sets["Si_Beag_Si_Mor"]="Airs"; 
keys+=( "Si_Beag_Si_Mor" )
sets["Carolans_Farewell"]="Airs"; 
keys+=( "Carolans_Farewell" )

cd ./abc
for set in "${sets[@]}"
do
	echo "" > "$set.tex" # create/clear all of the set .tex files
done


# iterate over all of the tunes in order
for tune in "${keys[@]}"
do 

	if [ -f "$tune.abc" ]
    then	
		echo "\begin{abc}[name=$tune]" >> "${sets[$tune]}.tex"
		abc2abc "$tune.abc" -e -t "$transpose" >> "${sets[$tune]}.tex" # add each tune to its set surrounded by the LaTeX strings
		echo "\end{abc}" >> "${sets[$tune]}.tex"
		echo "" >> "${sets[$tune]}.tex"
		
	else
	   echo "Couldn't find $tune.abc - made an empty file."
	   touch "$tune.abc"
	   echo "|CDEFGABc|"
	   abc2abc "$tune.abc" -e -t "$transpose" >> "${sets[$tune]}.tex" # add each tune to its set surrounded by the LaTeX strings
	fi
		
done

mv *.tex ../tex/


# build the tunebook using pdflatex
cd ../tex/
echo "First LaTeX run."
pdflatex --shell-escape build.tex &>/dev/null
echo "Second LaTeX run."
pdflatex --shell-escape build.tex &>/dev/null
cp build.pdf ../tunebook_new.pdf
echo "Done."