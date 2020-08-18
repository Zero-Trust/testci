# MIT License
# 
# Makefile
# 
# Copyright (c) 2020 冬ノ夜空
# 

TARGETS = gitnote.pdf
DELFILES = gitnote.listing gitgraph.txt rebase_before.txt rebase_after.txt 
# TARGETS = gitnote.pdf appendix.pdf
# OBJS = intro/introduction.tex notation/notation.tex chap1/chapter1.tex chap2/chapter2.tex chap3/chapter3.tex 

LATEXMK = latexmk 
LATEXMK_OPT = -cd -r ./.latexmkrc -f -gg


define removefile
$(1):
	@rm -f $(1)
	@echo "[delete]: $(1)"
endef

.PHONY: all
all: $(TARGETS)

gitnote.pdf: gitnote.tex 
	$(LATEXMK) $(LATEXMK_OPT) $<

appendix.pdf: appendix/appendix.tex
	$(LATEXMK) $(LATEXMK_OPT) $<

.PHONY: clean
clean: $(DELFILES)
	$(foreach file,$^,$(eval $(call removefile,$(file))))
	$(LATEXMK) -c $(TARGETS)

.PHONY: clean-all
clean-all: $(DELFILES)
	$(foreach file,$(DELFILES),$(eval $(call removefile,$(file))))
	$(LATEXMK) -C $(TARGETS)



