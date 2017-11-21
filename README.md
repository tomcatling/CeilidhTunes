# UCLU Ceilidh Band Tunebook (ABC)

It's time to transcribe our tunebook into ABC! This will be a boon for future generations and ensure our names live on forever.

ABC files generated and checked using EasyABC

Install files: https://www.dropbox.com/s/pb6e1hm7wyzb513/EasyABCInstall.zip?dl=0

Documentation: http://easyabc.sourceforge.net/

Other .abc programs should give similar results.

The tunebook (./tex/build.pdf) can built with LaTeX by running 

`pdflatex --shell-escape build.tex ; pdflatex --shell-escape build.tex ; cp build.pdf ../tunebook_new.pdf`

from within the ./tex/ directory. 

The LaTeX ABC package is required https://ctan.org/pkg/abc . The local abc.sty has been edited to allow code control of newlines.
