// reload profile
source ~/.bash_profile

// search all files containing "seach"
grep -lR "seach" ./

// exclude table from mysqldump
sed '/INSERT INTO `TABLE_TO_SKIP`/d' DBdump.sql > reduced.sql
