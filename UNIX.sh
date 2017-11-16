// reload profile
source ~/.bash_profile

// search all files containing "seach"
grep -lR "seach" ./

// exclude table from mysqldump
sed '/INSERT INTO `TABLE_TO_SKIP`/d' DBdump.sql > reduced.sql

// FInd multiple files, in multiple folders, and count lines
find -E ./app ./src ./doc -regex '.*\.(yml|php|feature|twig|md)' -exec cat {} \;| wc -l
