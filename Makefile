## Abandoned 2020, looking now because of MMED
## got rid of submodule makestuff; still using wrapR
# fitting_code

current: target
-include target.mk
Ignore = target.mk

vim_session:
	bash -ic "vmt"

## -include makestuff/perl.def

######################################################################

## Content

## These examples can't be older than H1N1pdm, but they're the oldest I have here

Sources += $(wildcard *.R *.csv)

mexican.Rout: mexican.csv read.R
	$(run-R)
mexican_fit.Rout: mexican.Rout routines.Rout fit.R
	$(run-R)
mexican_plots.Rout: mexican_fit.Rout plotfuns.Rout plots.R
	$(run-R)
mexican_ci.Rout: mexican_fit.Rout ci.R
	$(run-R)

######################################################################

## Sub-exponential fits (modularize more than above)

mexican_gen.Rout: mexican.Rout gen.R
	$(run-R)

######################################################################

makestuff.subclean:
%.subclean:
	git submodule deinit -f $*
	git rm -f $*
	rm -rf .git/modules/$*
	git commit -m "Remove $* submodule"

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff

## ln -s ../makestuff . ## Do this first if you want a linked makestuff
Makefile: makestuff/00.stamp
makestuff/%.stamp: | makestuff
	- $(RM) makestuff/*.stamp
	cd makestuff && $(MAKE) pull
	touch $@
makestuff:
	git clone --depth 1 $(msrepo)/makestuff

-include makestuff/os.mk

-include makestuff/wrapR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
