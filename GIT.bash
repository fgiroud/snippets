# commit sur preprod et pas sur master
git log preprod ^master --no-merges


#annuler le dernier commit non propage
git reset HEAD^
