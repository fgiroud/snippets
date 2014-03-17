<?php
// tous les chaines qui commencent par {% et finissent par %}
$regex = "#{%(.*?)%}#";


// extraction de liens avec une classe précise
preg_match_all('#<a class="css-class" href="(.*)">(.*)</a>#', $source, $matches);


// extraction d'url
preg_match('#href="([^\s"]+)#', $link, $matches);
