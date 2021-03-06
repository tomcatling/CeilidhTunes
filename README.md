# UCLU Ceilidh Band Tunebook (ABC)

ABC files were mostly checked and written using EasyABC, many copied from [thesession.org](http://thesession.org/) or [abcnotation.com](http://abcnotation.com/).

EasyABC install files: https://www.dropbox.com/s/pb6e1hm7wyzb513/EasyABCInstall.zip?dl=0

Documentation: http://easyabc.sourceforge.net/

Other .abc programs should give similar results.

The tunebook can be built by running generate_tunebook.sh. This requires 

* bash 4+
* abc2abc  
* pdflatex with the [abc package](https://ctan.org/pkg/abc?lang=en) installed. 

The local abc.sty in the ./tex/ directory has been edited to allow code control of newlines. The script takes an optional argument to transpose the output - e.g. `./generate_tunebook.sh 2` will generated a tunebook transposed by +2 semitones.

Running fix_columns.sh will attempt to fix the formatting **in place** of all tunes in the ./abc/ directory. It is very useful, but make sure to back-up your work first!

If you want to include a tune in a set you should add the filename (without the .abc suffix) and the set name to the array declarations at the start of generate_tunebook.sh. The abc file must exist in the ./abc/ directory and the set must be included in the main LaTeX file (./tex/build.tex) via `\include`.

Mp3 files can be generated by running generate_mp3s.sh. This requires 

* bash
* abc2midi
* timidity
* ffmpeg 

Output will be created for any .abc file in the ./abc/ directory. This script also takes an optional argument to transpose the output - e.g. `./generate_mp3s -2` will generated mp3s transposed by -2 semitones.


## To Do
* streamline addition of new sets and tunes
* add more dances
