.PHONY: main

TEXFILES:=HelloHaskell.tex

main: main.tex sample.bib ${TEXFILES}
	latexmk -pdf main.tex

%.tex: %.ipynb
	jupyter nbconvert --to latex --stdout $< \
		| awk '/\\maketitle/{f=1;next} /\\end{document}/{f=0} f' \
		> $@

