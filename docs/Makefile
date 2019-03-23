# Makefile to process Rmd files to create documentation
# Solution from https://stackoverflow.com/questions/30280323/makefile-process-all-files-in-one-directory-output-to-another
#

RMDDIR = rmd

INPUTS := $(wildcard ./*.Rmd)
OUTPUTS := $(patsubst ./%.Rmd, ./%.md, $(INPUTS))
OUTPUTS_HTML := $(patsubst .rmd/%.Rmd, ./%.html $(INPUTS))

all: $(OUTPUTS) $(OUTPUTS_HTML)
md: $(OUTPUTS)

%.md: $(RMDDIR)/%.Rmd
		Rscript -e "rmarkdown::render('$<', output_format='github_document', output_dir=here::here())"

%.html: %(RMDIR)/%.Rmd
		Rscript -e "rmarkdown::render_site(input=here::here('doc')"
# ./pdf/%.pdf: ./rmd/%.Rmd
# 		Rscript -e "rmarkdown::render('$<', output_format='pdf_document', output_dir=here::here('pdf'))"
