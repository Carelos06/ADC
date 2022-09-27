<?php
    $link = mysqli_connect("localhost", "id19629147_papu1", "2cR2~K|&?jbD^GWf") or die ("<h2>Error</h2>");;
    $bd = mysqli_select_db($link, "id19629147_citas") or die ("<h2>Error 2</h2>");
    
    $base=["usuario"];

    $correo=$_POST['correo'];
    $contraseña=$_POST['contraseña'];

    mysqli_query("insert into usuario values ('', '$correo', '$contraseña', '', 1)");
?>