for year in 2011 2012 2013 2014 
do
	./svm_rank_learn -c 20.0 data/train_${year}.txt model_${year}.txt
	./svm_rank_classify data/${year}.txt model_${year}.txt prediction_${year}.txt 
done
