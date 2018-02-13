judgement=$2
output=$1

./etc/trec_eval.9.0/trec_eval -q ${judgement} ${output} > ${output}.treceval
tail -29 ${output}.treceval | grep -e '^map' -e 'recip_rank' -e 'P_30'
exit 0

