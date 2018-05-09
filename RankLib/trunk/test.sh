for ranker in 6
do 
	for year in 2011 2012 2013 2014 
	do
		echo "running java -jar bin/RankLib.jar -train data/train_${year}.txt -test data/${year}.txt -validate data/val_${year}.txt -ranker ${ranker} -metric2t P@30 -metric2T P@30 -save model_${ranker}_${year}.txt 
"
		java -jar bin/RankLib.jar -train data/train_${year}.txt -test data/${year}.txt -validate data/val_${year}.txt -ranker ${ranker} -metric2t P@30 -metric2T P@30 -save model_${ranker}_${year}.txt -feature feature.txt
		java -jar bin/RankLib.jar -load model_${ranker}_${year}.txt -rank data/${year}.txt -score score_${ranker}_${year}.txt
	done
done