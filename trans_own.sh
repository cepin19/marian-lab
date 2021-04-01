#!/bin/bash

m=model/model_base_$(whoami).npz
$marian/guessmarian-decoder -v model/encs.spm model/encs.spm  -m $m --beam-size 6 --mini-batch 32 --maxi-batch 100 --maxi-batch-sort src -w 128 --cpu-threads 16  --log trans_own.log # > news19.translated
#cat news19.translated | python3 -m sacrebleu -l en-cs -t wmt19 --width 4 --metrics bleu
#cat news19.translated | python3 -m sacrebleu -l en-cs -t wmt19 --width 4 --metrics chrf 

