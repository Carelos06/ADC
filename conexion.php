<?php
    $link = mysql_connect("localhost", "root", "") or die ("<h2>Error</h2>");;
    $bd = mysql_select_bd("citas", $link) or die ("<h2>Error 2</h2>");
    
    $correo=$_POST['correo'];
    $contraseña=$_POST['contraseña'];

    mysql_query ("insert into usuario values ('', '$correo', '$contraseña', '', 1)");
?>