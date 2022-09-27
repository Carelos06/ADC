<?php
    $link = mysqli_connect("localhost", "papu1", "") or die ("<h2>Error</h2>");;
    $bd = mysqli_select_db("id19629147_citas", $link) or die ("<h2>Error 2</h2>");
    
    $correo=$_POST['correo'];
    $contraseña=$_POST['contraseña'];

    mysqli_query("insert into usuario values ('', '$correo', '$contraseña', '', 1)");
?>