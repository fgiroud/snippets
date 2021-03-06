# LOAD CSV
mysql -uroot -proot --local-infile nsv11 -e "LOAD DATA LOCAL INFILE 'file.csv'  INTO TABLE tmpcls  FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'"

# FOREIGN KEYS CONSTRAINTS CHECK
SET foreign_key_checks = 0;
SET foreign_key_checks = 1;

# UPDATE + LEFT JOIN
UPDATE table t1
LEFT JOIN t2 ON t2.id=t1.join_id
SET t1.key=t2.key


# DOUBLONS
SELECT *, COUNT(*) AS count  
FROM table
GROUP BY field_with_duplicate
HAVING COUNT(*) > 1

# RESET TABLE
UPDATE table_name t SET t.email=CONCAT('test_', t.id, 'custom_value');


# RECORD WITHOUT JOIN
SELECT d.*, COUNT(*) FROM tablename d 
WHERE d.id NOT IN (SELECT join_column FROM join_table) 
GROUP BY d.id

# RECORD WITHOUT JOIN
SELECT *
FROM  commande C 
       LEFT OUTER JOIN transaction T
            ON C.id = T.commande_id
WHERE T.id IS NULL


# COUNT RECORD WITHOUT JOIN + GROUP BY
SELECT t.nom, COUNT(*) FROM diplomes d 
LEFT JOIN type_diplome t ON t.id=d.type_diplome_id
WHERE d.id NOT IN (SELECT diplome_id FROM competences)
AND t.is_active=1
GROUP BY type_diplome_id


# GROUP CONCAT
GROUP_CONCAT( f1, f2 SEPARATOR "---" ) AS f;






# DATA INTEGRITY CHECKS
SELECT CONCAT(
 'SELECT ', GROUP_CONCAT(DISTINCT CONCAT(K.CONSTRAINT_NAME, '.', P.COLUMN_NAME,
  ' AS `', P.TABLE_SCHEMA, '.', P.TABLE_NAME, '.', P.COLUMN_NAME, '`') ORDER BY P.ORDINAL_POSITION),
CONCAT(',"', K.REFERENCED_TABLE_NAME, '" AS missing_relation'),
' ',
 'FROM ', K.TABLE_SCHEMA, '.', K.TABLE_NAME, ' AS ', K.CONSTRAINT_NAME, ' ',
 'LEFT OUTER JOIN ', K.REFERENCED_TABLE_SCHEMA, '.', K.REFERENCED_TABLE_NAME, ' AS ', K.REFERENCED_TABLE_NAME, ' ',
 ' ON (', GROUP_CONCAT(CONCAT(K.CONSTRAINT_NAME, '.', K.COLUMN_NAME) ORDER BY K.ORDINAL_POSITION),
 ') = (', GROUP_CONCAT(CONCAT(K.REFERENCED_TABLE_NAME, '.', K.REFERENCED_COLUMN_NAME) ORDER BY K.ORDINAL_POSITION), ') ',
 'WHERE ', K.REFERENCED_TABLE_NAME, '.', K.REFERENCED_COLUMN_NAME, ' IS NULL;'
 ) AS _SQL
 FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE K
 INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE P
 ON (K.TABLE_SCHEMA, K.TABLE_NAME) = (P.TABLE_SCHEMA, P.TABLE_NAME)
 AND P.CONSTRAINT_NAME = 'PRIMARY'
 WHERE K.REFERENCED_TABLE_NAME IS NOT NULL
AND K.TABLE_SCHEMA="nsv2"
 GROUP BY K.CONSTRAINT_NAME;
