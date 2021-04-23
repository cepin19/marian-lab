#!/bin/bash
$marian/guessmarian-decoder $@ \
   --relative-paths -m model/encs.student.base/model.npz.best-bleu-detok.npz -v model/encs.student.base/vocab.csen.spm model/encs.student.base/vocab.csen.spm \
   --beam-size 1 --mini-batch 32 --maxi-batch 100 --maxi-batch-sort src -w 128 \
   --skip-cost --cpu-threads 16 \
   --quiet --quiet-translation --log trans_student_base_beam1.log 

