.PHONY: clean plots

sigurt-sidi-thesis.pdf: tmp/report.pdf
	cp $< $@

tmp:
	mkdir tmp

tmp/report.pdf: *.tex tmp plots
	latexmk --output-directory=tmp -pdf report.tex

preview: *.tex tmp
	latexmk --output-directory=tmp -pdf -pvc report.tex

clean:
	rm -rf tmp/*
	find plots/* \( -not -name 'tables.sh' -not -name 'runtimes-for-plotting.gnu' \) -delete

plots: tables
	@(cd plots; gnuplot runtimes-for-plotting.gnu)

tables:
	@(cd plots; ./tables.sh)
