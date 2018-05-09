for model in matchpyramid drmm knrm duet
do 
	cp ~/interpolation/predict.inter.test.${model}.test_2011.treceval run.microblog2012.${model}.txt.treceval
	cp ~/interpolation/predict.inter.test.${model}.test_2013.treceval run.microblog2014.${model}.txt.treceval
	cp ~/interpolation/predict.inter.test.${model}.train_2013.treceval run.microblog2013.${model}.txt.treceval
	cp ~/interpolation/predict.inter.test.${model}.train_2011.treceval run.microblog2011.${model}.txt.treceval
done

for year in 2011 2012 2013 2014
do 
	for model in matchpyramid drmm knrm duet
	do 
		mv run.microblog${year}.${model}.txt.treceval run.microblog${year}.${model}+.txt.treceval
	done

done
