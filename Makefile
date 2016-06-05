# fitting_code
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: notarget

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R *.csv)

mexican_ci.Rout: mexican_fit.Rout ci.R
mexican_fit.Rout: mexican.Rout routines.Rout fit.R
mexican_plots.Rout: mexican_fit.Rout plotfuns.Rout plots.R
mexican.Rout: mexican.csv read.R
mexican_summary.Rout: mexican_fit.Rout summary.R

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
