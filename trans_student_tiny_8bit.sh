#!/bin/bash
$marian/guessmarian-decoder $@ \
   --relative-paths -m model/encs.student.tiny11/model.8bit-finetuned.npz -v model/encs.student.tiny11/vocab.spm model/encs.student.tiny11/vocab.spm \
   --beam-size 1 --mini-batch 32 --maxi-batch 100 --maxi-batch-sort src -w 128 \
   --skip-cost --shortlist model/encs.student.tiny11/lex.s2t.gz 50 50 --cpu-threads 16 \
   --quiet --quiet-translation --log trans_student_tiny_8bit.log 

