.PHONY: clean plots

report.pdf: tmp/report.pdf
	cp $< $@

tmp:
	mkdir tmp

tmp/report.pdf: *.tex tmp plots/*.tex
	latexmk --output-directory=tmp -pdf report.tex

preview: *.tex tmp
	latexmk --output-directory=tmp -pdf -pvc report.tex

clean:
	rm tmp/*

plots: tables
	(cd plots; gnuplot runtimes-for-plotting.gnu;

tables:
	(cd plots; ./tables.sh)
