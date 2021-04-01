#!/bin/bash
echo "model, BLEU, time(s)" > speed_results
for trans in trans_base.sh  trans_own.sh trans_base_beam1.sh  trans_student_base.sh trans_student_base_beam1.sh trans_student_base_shortlist.sh trans_student_tiny.sh  trans_student_tiny_8bit.sh
do
	model=$(echo $trans | sed 's/\.sh//g' | sed 's/trans_//g')
	cat corp/news19.en.snt | ./$trans > news19.translated_by_$model 
	time=$(tail -n1 trans_$model.log | sed 's/.*Total time://g' | sed 's/s.*//g' )
	bleu=$(cat news19.translated_by_$model  | python3 -m sacrebleu -l en-cs -t wmt19 --width 3 | cut -f 3 -d ' ' | cut -f 1 -d ',')
	echo $model, $bleu, $time >> speed_results

done
