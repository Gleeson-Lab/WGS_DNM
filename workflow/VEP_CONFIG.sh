#!/bin/sh

# to run vep you must set up these environment variables

alias perl="/projects/ps-gleesonlab7/gleeson3/resources/perl_5.26.3/bin/perl"
export PATH=/projects/ps-gleesonlab7/gleeson3/resources/perl_5.26.3/bin:$PATH
export PERL5LIB=/projects/ps-gleesonlab7/gleeson3/resources/perl_5.26.3
export PERL5LIB=/projects/ps-gleesonlab7/gleeson3/resources/perl_5.26.3/lib/5.26.3:$PERL5LIB
# VEP
export PERL5LIB=/projects/ps-gleesonlab7/gleeson3/resources/vep_106/plugins:$PERL5LIB
# LOFTEE
export KENT_SRC=/projects/ps-gleesonlab7/gleeson3/resources/tools/kent/src
export PATH=/projects/ps-gleesonlab7/gleeson3/resources/tools/kent/src:$PATH
export PERL5LIB=/projects/ps-gleesonlab7/gleeson3/resources/vep_101/plugins_loftee_hg38:$PERL5LIB
export PERL5LIB=/home/dantakli/anaconda3/envs/loftee/lib/perl5:$PERL5LIB
