import json
import os
import numpy as np
import shlex
import subprocess
import sys
import random

def cal_score(fn_qrels="qrels_all.txt", prediction="score.txt"):
    cmd = "/bin/sh run_eval.sh {} {}".format(prediction, fn_qrels)
    pargs = shlex.split(cmd)
    p = subprocess.Popen(pargs, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    pout, perr = p.communicate()
    print("running {}".format(cmd))
    if len(pout) != 0:
        print(pout.decode('utf-8'))
    else:
        print(perr.decode('utf-8'))
    if sys.version_info[0] < 3:
        lines = pout.split('\n')
    else:
        lines = pout.split(b'\n')
    Map = float(lines[0].strip().split()[-1])
    Mrr = float(lines[1].strip().split()[-1])
    P30 = float(lines[2].strip().split()[-1])



datasets = ["train_2011", "test_2011", "train_2013", "test_2013"]
years = ["2011", "2012", "2013", "2014"]
ranker = 4
for dataset, year in zip(datasets, years):
    # dataset = "test_2013"
    # year = "2014"
    print("testing year: {}".format(year))
    fn = "/u4/w85yang/deep-tweet-search/data/twitter/order_by_rel/{}".format(dataset)
    s = open("score_{}_{}.txt".format(ranker, year))
    c = open(os.path.join(fn, "id.txt"))
    score_file = "score_{}.txt".format(year)
    out = open(score_file, "w")
    out2 = open(score_file+"2", "w")
    for S, ID in zip(s, c):
        qid1, iternum, docno, aid, undefined, run_id = ID[:-1].split()
        qid2, docID, score = S[:-1].split("\t")
        assert qid1 == qid2
        out.write("{} Q0 {} {} {} lucene4lm\n".format(qid1, docno, int(docID)+1, score))
        out2.write("{} {}\n".format(docno, float(score)))
        
    out.close()
    out2.close()
    c.close()
    s.close()
    cal_score(prediction=score_file)

