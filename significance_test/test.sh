for baseline in L2R QL RM3  
do 
	for model in RM3 mhcnn duet+ drmm+ knrm+ mhcnn+ L2R 
	do 
		if [ ${baseline} != ${model} ]
		then
			for year in 2011 2012 2013 2014
			do 
				# echo "running perl -w paired-randomization-test-v2.pl -t a -d desiredMetricsFile.txt ./baselines/run.microblog${year}.${baseline}.txt.treceval ./models/run.microblog${year}.${model}.txt.treceval &> ${model}_${baseline}_${year}.out"
				echo "running baseline: ${baseline} model: ${model} year: ${year}"
				perl -w paired-randomization-test-v2.pl -t a -d desiredMetricsFile.txt ./baselines/run.microblog${year}.${baseline}.txt.treceval ./models/run.microblog${year}.${model}.txt.treceval 
			done
		fi
	done
done