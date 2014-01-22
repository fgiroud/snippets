# DOUBLONS

SELECT *, COUNT(*) AS count  
FROM table
GROUP BY field_with_duplicate
HAVING COUNT(*) > 1