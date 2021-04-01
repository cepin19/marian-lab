dev="5"

$marian/guessmarian \
	--model model/model_base_"$(whoami)".npz --type transformer  --task transformer-base --pretrained-model model/model_base.npz \
    --train-sets   corp/corp1k.en corp/corp1k.cs  \
    --max-length 100 \
    --vocabs model/encs.spm model/encs.spm \
    --mini-batch 16 --maxi-batch 1 -w 512 \
    --valid-freq 60 --save-freq 5000 --disp-freq 1 \
    --valid-metrics ce-mean-words perplexity translation\
    --valid-sets corp/news19.en.snt corp/news19.cs.snt \
    --valid-script-path ./val.sh \
    --valid-translation-output data/valid.output_"$(whoami)".update{U} \
    --beam-size 3 --normalize=0.6 \
    --valid-mini-batch 16 \
     --keep-best --after 60u \
    --early-stopping 95 --cost-type=ce-mean-words \
    --log model/base_para.log --valid-log data/valid.log \
    --enc-depth 6 --dec-depth 6 \
    --learn-rate 0.0003  --lr-decay-inv-sqrt 8000 --lr-report \
    --optimizer-params 0.9 0.98 1e-09 --clip-norm 5 \
    --devices $dev  --sync-sgd --seed 12345 --cpu-threads 16 \
	--exponential-smoothing  --shuffle-in-ram  --no-restore-corpus --no-shuffle

