report.pdf: tmp/report.pdf
	cp $< $@

tmp:
	mkdir tmp

tmp/report.pdf: report.tex tmp
	latexmk --output-directory=tmp -pdf

preview: report.tex tmp
	latexmk --output-directory=tmp -pdf -pvc
