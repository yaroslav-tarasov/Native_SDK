#--------------------------------------------------------------------------
# Name         : content.mak
# Title        : Makefile to build content files
#
# Copyright    : Copyright (C) by Imagination Technologies Limited.
#
# Description  : Makefile to wrap content files for examples in the PowerVR SDK
#
# Platform     :
#
#--------------------------------------------------------------------------

#############################################################################
## Variables
#############################################################################
FILEWRAP 	= ..\..\..\..\Utilities\Filewrap\Windows_x86_32\Filewrap.exe
CONTENTDIR = Content

#############################################################################
## Instructions
#############################################################################

RESOURCES = \
	$(CONTENTDIR)/FragShader.cpp \
	$(CONTENTDIR)/VertShader.cpp \
	$(CONTENTDIR)/Cylinder.cpp \
	$(CONTENTDIR)/Sphere.cpp \
	$(CONTENTDIR)/Lattice.cpp \
	$(CONTENTDIR)/Stone.cpp \
	$(CONTENTDIR)/Tile.cpp

all: resources
	
help:
	@echo Valid targets are:
	@echo resources, clean
	@echo FILEWRAP can be used to override the default path to the Filewrap utility.

clean:
	@for i in $(RESOURCES); do test -f $$i && rm -vf $$i || true; done

resources: $(RESOURCES)

$(CONTENTDIR):
	-mkdir "$@"

$(CONTENTDIR)/FragShader.cpp: $(CONTENTDIR) ./FragShader.fsh
	$(FILEWRAP)  -s  -o $@ ./FragShader.fsh

$(CONTENTDIR)/VertShader.cpp: $(CONTENTDIR) ./VertShader.vsh
	$(FILEWRAP)  -s  -o $@ ./VertShader.vsh

$(CONTENTDIR)/Cylinder.cpp: $(CONTENTDIR) ./Cylinder.pod
	$(FILEWRAP)  -o $@ ./Cylinder.pod

$(CONTENTDIR)/Sphere.cpp: $(CONTENTDIR) ./Sphere.pod
	$(FILEWRAP)  -o $@ ./Sphere.pod

$(CONTENTDIR)/Lattice.cpp: $(CONTENTDIR) ./Lattice.pvr
	$(FILEWRAP)  -o $@ ./Lattice.pvr

$(CONTENTDIR)/Stone.cpp: $(CONTENTDIR) ./Stone.pvr
	$(FILEWRAP)  -o $@ ./Stone.pvr

$(CONTENTDIR)/Tile.cpp: $(CONTENTDIR) ./Tile.pvr
	$(FILEWRAP)  -o $@ ./Tile.pvr

############################################################################
# End of file (content.mak)
############################################################################
