<?php


// Simple PDo connection

$dns = 'mysql:host=localhost;dbname=logiciel';
$user = 'root';
$pwd = '123';
$connection = new PDO( $dns, $user, $pwd );

$query = 'SELECT * FROM clone_toocharger_categories';
$select = $connection->query($query);
$records=$select->fetchAll(PDO::FETCH_OBJ);

foreach($records as $record){
    var_dump($record);
}
