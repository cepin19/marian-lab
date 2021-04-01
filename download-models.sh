#!/usr/bin/env bash
mkdir model data 
set -e

cd model/

# download newstest19
python3 -m pip install sacrebleu --user
#python3 -m sacrebleu --echo src -l en-cs -t wmt19 > corp/news19.en.snt
#python3 -m sacrebleu --echo ref -l en-cs -t wmt19 > corp/news19.cs.snt

#base model trained only on czeng-train
wget -nc https://transfer.sh/gvSLq/model_base.npz
wget -nc https://transfer.sh/I75Xe/encs.spm

#bergamot models
for lang in encs
do
	for model in base tiny11
	do
		mkdir -p $lang.student.$model
		cd $lang.student.$model
		wget -nc http://data.statmt.org/bergamot/models/8bit-students/$lang/$model/model.8bit-finetuned.npz
	#	wget -nc http://data.statmt.org/bergamot/models/8bit-students/$lang/$model/model.8bit-finetuned.alphas.npz
	#	wget -nc http://data.statmt.org/bergamot/models/8bit-students/$lang/$model/model.8bit-finetuned.intgemm8.bin
	#	wget -nc http://data.statmt.org/bergamot/models/8bit-students/$lang/$model/model.8bit-finetuned.intgemm8.alphas.bin
		wget -nc http://data.statmt.org/bergamot/models/8bit-students/$lang/$model/model.npz.best-bleu-detok.npz
		wget -nc http://data.statmt.org/bergamot/models/8bit-students/$lang/$model/lex.s2t.gz
		wget -nc http://data.statmt.org/bergamot/models/8bit-students/$lang/$model/vocab.spm
		cd ..
	done
done
