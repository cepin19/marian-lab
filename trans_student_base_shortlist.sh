#!/bin/bash
$marian/guessmarian-decoder $@ \
   --relative-paths -m model/encs.student.base/model.npz.best-bleu-detok.npz -v model/encs.student.base/vocab.csen.spm model/encs.student.base/vocab.csen.spm \
   --beam-size 1 --mini-batch 32 --maxi-batch 100 --maxi-batch-sort src -w 128 \
   --skip-cost --shortlist model/encs.student.base/lex.s2t.gz 50 50 --cpu-threads 16 \
   --quiet --quiet-translation --log trans_student_base_shortlist.log 

