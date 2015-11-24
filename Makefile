TEXTARGETS = $(wildcard *.c)

plosone: main_plosone.bbl $(TEXTARGETS)
	pdflatex --shell-escape main_plosone.tex
	pdflatex --shell-escape main_plosone.tex

bioarxiv: main.bbl $(TEXTARGETS)
	pdflatex --shell-escape main.tex
	pdflatex --shell-escape main.tex

main_plosone.bbl:
	pdflatex --shell-escape main_plosone.tex
	bibtex main_plosone

main.bbl:
	pdflatex --shell-escape main.tex
	bibtex main

clean:
	rm -rf *.log *.aux *.out *.out.pyg *.pyg *.bbl *.blg _minted-main_plosone/ *.pdf auto _minted_main/
