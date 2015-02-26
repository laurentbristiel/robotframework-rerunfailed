# clean previous output files
rm -f output/output.xml
rm -f output/rerun.xml
rm -f output/first_run_log.html
rm -f output/second_run_log.html

echo
echo "#######################################"
echo "# Running portfolio a first time      #"
echo "#######################################"
echo
pybot --outputdir output $@

# we stop the script here if all the tests were OK
if [ $? -eq 0 ]; then
	echo "we don't run the tests again as everything was OK on first try"
	exit 0	
fi
# otherwise we go for another round with the failing tests

# we keep a copy of the first log file
cp output/log.html  output/first_run_log.html

# we launch the tests that failed
echo
echo "#######################################"
echo "# Running again the tests that failed #"
echo "#######################################"
echo
pybot --outputdir output --nostatusrc --rerunfailed output/output.xml --output rerun.xml $@
# => Robot Framework generates file rerun.xml

# we keep a copy of the second log file
cp output/log.html  output/second_run_log.html

# Merging output files
echo
echo "########################"
echo "# Merging output files #"
echo "########################"
echo
rebot --nostatusrc --outputdir output --output output.xml --rerunmerge output/output.xml  output/rerun.xml
# => Robot Framework generates a new output.xml