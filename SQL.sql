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


# COUNT RECORD WITHOUT JOIN + GROUP BY
SELECT t.nom, COUNT(*) FROM diplomes d 
LEFT JOIN type_diplome t ON t.id=d.type_diplome_id
WHERE d.id NOT IN (SELECT diplome_id FROM competences)
AND t.is_active=1
GROUP BY type_diplome_id


# GROUP CONCAT
GROUP_CONCAT( f1, f2 SEPARATOR "---" ) AS f;


# FOREIGN KEYS CONSTRAINTS CHECK
SET foreign_key_checks = 0;
SET foreign_key_checks = 1;
