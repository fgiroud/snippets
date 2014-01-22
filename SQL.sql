# DOUBLONS
SELECT *, COUNT(*) AS count  
FROM table
GROUP BY field_with_duplicate
HAVING COUNT(*) > 1

# RESET TABLE
UPDATE table_name t SET t.email=CONCAT('test_', t.id, 'custom_value');