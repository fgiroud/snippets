<?php


ini_set('display_errors', 1);
error_reporting(E_ALL); 


$login = '----------';
$pwd = '----------';
$host = 'localhost';


$db1 = '----------';
$db2 = '----------';

/*
$login="root";
$pwd="123";
$db1="nostra";

*/


$conn1 = new PDO("mysql:host=$host;dbname=$db1", $login, $pwd); // connexion à la BDD
$conn2 = new PDO("mysql:host=$host;dbname=$db2", $login, $pwd); // connexion à la BDD

$tables = array();


$update_queries = array();

foreach($tables as $table){
    
    
    try{
        $res = getNb($table, $conn1, $conn2);
        
        $nb_prod = $res[0];
        $nb_preprod = $res[1];
        
        if($nb_prod != $nb_preprod){
            echo '<br/>';
            
            
            $sql =  "INSERT INTO `$db2`.`$table` SELECT * FROM `$db1`.`$table` WHERE `$db1`.`$table`.`id` NOT IN (SELECT `id` FROM `$db2`.`$table`);";
            $update_queries[]=$sql;
            echo '<br/>';
        }
        
        echo $table;
        echo '<br/>';
        echo '---------- <br/>';
        echo 'prod : '.$nb_prod;
        echo '<br/>';
        echo 'preprod_v2 : '.$nb_preprod;
        echo '<br/>';
        
        echo '<hr/>';
        
}
catch(Exception $e){
    echo $e->getMessage();
}
    
 
   
}


function getNb($table, $conn1, $conn2){
    $sql = "SELECT COUNT(*) FROM ".$table;
    $res = $conn1->query($sql);
    $row = $res->fetch(PDO::FETCH_NUM);
    
    $res = $conn2->query($sql);
    if(!$res){
        echo "###".$table;
    }
    $row2 = $res->fetch(PDO::FETCH_NUM);
    
    return array(
        $row[0],
        $row2[0],
    );
}

echo "
SET foreign_key_checks = 0;
SET AUTOCOMMIT=0;
START TRANSACTION;";
echo implode('<br/> ', $update_queries);

echo "
COMMIT;
SET foreign_key_checks = 1;
";

?>
