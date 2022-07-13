.PHONY: main clean

TEXFILES=part1.tex part2.tex part3.tex partA.tex ${NBTEXFILES}
NBTEXFILES:= HelloHaskell.tex \
	  ArithExpr.tex \
	  ParaPoly.tex \
	  FunEval.tex \
	  FunArithEval.tex \
	  Parser.tex \
	  FACT.tex \
	  TyInf.tex \
	  TyInfMore.tex \
	  HWsample.tex

main: main.tex sample.bib ${TEXFILES}
	latexmk -pdf main.tex

clean:
	rm -f *.aux *.bbl *.blg *.bcf main.toc main.fls main.fdb_latexmk ${NBTEXFILES}
	rm -rf *_files/


%.tex: %.ipynb
	sed -i '/"header":/d' $< \
		&& jupyter nbconvert --to latex $< \
		&& gawk -i inplace '/\\maketitle/{f=1;next} /\\end{document}/{f=0} f' $@ \
		&& sed -i 's/colframe=cellborder]/colframe=cellborder, top=.75ex]/;s/framerule=2mm/framerule=1mm/' $@

