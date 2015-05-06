# commit sur preprod et pas sur master
git log preprod ^master --no-merges


#annuler le dernier commit non propage
git reset HEAD^



#purge sal dump from particular table inserts
sed '/INSERT INTO `TABLE_TO_SKIP`/d' DBdump.sql > reduced.sql
