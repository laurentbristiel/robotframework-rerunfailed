rm -f output/output.xml
rm -f output/rerun.xml
rm -f output/first_run_log.html
rm -f output/second_run_log.html

pybot --outputdir output $@

exit 0

# we stop the script here if all the tests were OK
if [ $? -eq 0 ]; then
	echo "we don't run the tests again as everything was OK on first try"
	exit 0	
fi

# otherwise we go for another round with the failing tests

# we keep a copy of the first log file
cp output/log.html  output/first_run_log.html

# we launch the tests that failed
pybot --nostatusrc --rerunfailed output/output.xml --output rerun.xml testcases
# => Robot Framework generates file rerun.xml

# we keep a copy of the second log file
cp output/log.html  output/second_run_log.html

# Merging output files
rebot --nostatusrc --outputdir output --output output.xml --rerunmerge output/output.xml  output/rerun.xml
# => Robot Framework generates a new output.xml