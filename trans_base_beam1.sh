#!/bin/bash
python3 -m sacrebleu --echo src -l en-cs -t wmt19 > corp/news19.en.snt
m=model/model_base.npz
$marian/guessmarian-decoder -v model/encs.spm model/encs.spm  -m $m --beam-size 1 --skip-cost --mini-batch 32 --maxi-batch 100 --maxi-batch-sort src -w 128 --cpu-threads 16  --log trans_base_beam1.log # > news19.translated
#cat news19.translated | python3 -m sacrebleu -l en-cs -t wmt19 --width 4 --metrics bleu
#cat news19.translated | python3 -m sacrebleu -l en-cs -t wmt19 --width 4 --metrics chrf 

