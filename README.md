First of all, set path to your marian-guesser 

on UFAL network:
export marian=/lnet/express/work/people/jon/marian-dist

on AIC:
export marian=/lnet/aic/personal/jon/marian-dist

elsewhere:
first run "marian-installer.sh $PWD/marian", if everything is ok, export marian=$PWD/marian

then
./download-models.sh

now you can "finetune" the model on CPU (it will get worse probably, since the batch size is too low, but it is ok for demonstrating training output)
./trans.sh

it will take ~2 minutes for training to start, then it will run for 60 updates (each consisting of 16 sentences), few seconds each
after 60 updates, the model is evaluated in terms of validation set cross-entropy, perplexity and BLEU score
val.sh is called for BLEU score computation using SacreBleu (but marian can do that itself, replace "translation" by "bleu" in --valid-metrics training option )

after outputting the validation BLEU score, training is done, the modified model is saved into model/model_base_$(whoami).npz

now you can see how fast can Marian be:
./compare_speeds.sh


