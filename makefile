report.pdf: tmp/report.pdf
	cp $< $@

tmp:
	mkdir tmp

tmp/report.pdf: *.tex tmp
	latexmk --output-directory=tmp -pdf

preview: *.tex tmp
	latexmk --output-directory=tmp -pdf -pvc report.tex
