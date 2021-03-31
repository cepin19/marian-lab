First of all, set path to your marian-guesser 

on UFAL network:
export marian=/lnet/express/work/people/jon/marian-dist

on AIC:
export marian=/lnet/aic/personal/jon/marian-dist

elsewhere:
first run "marian-installer.sh $PWD/marian", if everything is ok, export marian=$PWD/marian

then
./download-models.sh

