#!/bin/bash
date=`date +"%d_%m_%Y_%H:%M"`
cat $1 | perl fix-cs-quotes-etc.pl  > data/output.postprocessed.encs.$date
cat data/output.postprocessed.encs.$date   |python3 -m sacrebleu  -l en-cs -t wmt19 > data/bleu.postprocessed.encs.$date
cat data/output.postprocessed.encs.$date   |python3 -m sacrebleu  -l en-cs -t wmt19 --width 4 -m chrf  > data/chrf.postprocessed.encs.$date



cat data/bleu.postprocessed.encs.$date | cut -f 3 -d ' ' | cut -f 1 -d ',' 

