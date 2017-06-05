# fitting_code
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: mexican_plots.Rout 

##################################################################

# make files

Sources = Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

##################################################################

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

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
