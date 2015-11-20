all: main_plosone.bbl
	pdflatex --shell-escape main_plosone.tex
	pdflatex --shell-escape main_plosone.tex

main_plosone.bbl:
	pdflatex --shell-escape main_plosone.tex
	bibtex main_plosone

clean:
	rm -rf *.log *.aux *.out *.out.pyg *.pyg *.bbl *.blg _minted-main_plosone/ *.pdf auto
