<?php
namespace App\Controllers;
use App\Models\Turno;
use \Firebase\JWT\JWT;

class FacturaController {

    public function getAll ($request, $response, $args) {
        //Token
        $headersEnvio = getallheaders();
        $key = "pro3-parcial";  
        $miToken = $headersEnvio["token"] ?? 'No mando Token';
        $decoded = JWT::decode($miToken, $key, array('HS256'));
        $decoded_array = (array) $decoded;
        //tomo email 
        $verificoEmail = $decoded_array['email'];
        
        $rta = Turno::from('turnos as t')
               ->Join('mascotas','t.tipo', '=' , 'mascotas.tipo')   //leftJoin - rightJoin - crossJoin - Join
               ->Join('users','t.usuario_FK', '=' , 'users.email')
               ->select('users.nombre','mascotas.precio')
               ->orderByRaw('users.nombre')
               ->where('users.email', '=',  $verificoEmail) 
               ->get();

        $response->getBody()->write(json_encode($rta));
        return $response;
    }
}