# UCLU Ceilidh Band Tunebook (ABC)

It's time to transcribe our tunebook into ABC! This will be a boon for future generations and ensure our names live on forever.

ABC files were mostly checked and written using EasyABC, many copied from http://thesession.org/ or http://abcnotation.com/ to begin with.

EasyABC install files: https://www.dropbox.com/s/pb6e1hm7wyzb513/EasyABCInstall.zip?dl=0

Documentation: http://easyabc.sourceforge.net/

Other .abc programs should give similar results.

The tunebook (./tex/build.pdf) can built with LaTeX by running 

`pdflatex --shell-escape build.tex ; pdflatex --shell-escape build.tex ; cp build.pdf ../tunebook_new.pdf`

from within the ./tex/ directory. 

The LaTeX ABC package is required https://ctan.org/pkg/abc . The local abc.sty has been edited to allow code control of newlines.

Each set is in it's own .tex file with each tune in the set being precedeed by \begin{abc}[name] and followed by \end{abc}. For example

    './King_of_the_Fairies.tex'
    
    \begin{abc}[name=King_of_the_Fairies]
    X: 1
    T: King Of The Fairies
    R: hornpipe
    M: 4/4
    L: 1/8
    K: Edor
    |:B,2|EDEF GFGA|B2B2 G2GA|B2E2 EFGE|FGFE D2B,2|
    EDEF GFGA|BAGB d3c|B2E2 GFE_E|E6 :|]
    |:d2|e2e2 Bdef|gagf e3f|e2B2 BABc|dedc BcdB|
    e2B2 Bdef|gagf efed|Bdeg fedf|e6 ef|
    g3e f3d|edBc d3e|dBAF GABc|dBAF GFED|
    B,2E2 EFGA|B2e2 edef|e2B2 BAGF|E6:|]
    \end{abc}

    \begin{abc}[name=Red_Haired_Boy]
    X: 1
    T: The Red Haired Boy
    R: reel
    M: 4/4
    L: 1/8
    K: Amix
    |:"A"EAAG ABcd|efec "D"d2 cd|"A"eAAA ABcA|"G"B=GEF "G"G2 FG|
    "A"EAAG ABcd|efec "D"d2 cd|"A"eaaa afed|cA"E"BG "A"A4 :|]
    |: "G"g2 g"G"a gfef|gfec "D"d2 cd|"A"eAAA ABcA|"G"B=GEF G2 FG|
    "A"EAAG ABcd|efec "D"d2 cd|"A"eaaa afed|cA"E"BG "A"A4 :|]
    \end{abc}

This is included in ./tex/build.tex in it's own section and added to the table of contents like so

    './tex/build.tex'
    
    \section*{King of the Fairies (not finished)}
    \addcontentsline{toc}{section}{King of the Fairies}
    \input{../King_of_the_Fairies}

note that `input{../King_of_the_Fairies}` in ./tex/build.tex refers to the name of the .tex file (the set) whereas `\begin{abc}[name=King_of_the_Fairies]` within King_of_the_Fairies.tex just refers to the tune name. The LaTeX ABC packge generates lots of working files with each tune name in the ./tex/ directory, which is why it's useful to keep it separate.