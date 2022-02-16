.PHONY: main

TEXFILES:=HelloHaskell.tex ArithExpr.tex

main: main.tex sample.bib ${TEXFILES}
	latexmk -pdf main.tex

%.tex: %.ipynb
	jupyter nbconvert --to latex $< \
		&& gawk -i inplace '/\\maketitle/{f=1;next} /\\end{document}/{f=0} f' $@ \
		&& sed -i 's/colframe=cellborder]/colframe=cellborder, top=.75ex]/;s/framerule=2mm/framerule=1mm/' $@

