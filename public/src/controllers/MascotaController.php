<?php
namespace App\Controllers;
use App\Models\Mascota;
use \Firebase\JWT\JWT;

class MascotaController {

    public function add($request, $response, $args)
    {
        //Obtemos datos del body
        $dato = $request->getParsedBody();
        $tipo = $dato['tipo']?? '';
        $precio = $dato['precio']?? '';
        

        if(isset($tipo) && isset($precio)){
            if ($tipo == "perro" or $tipo == "gato" or $tipo == "huron") {
                // Graba en la Base de Datos
                $user = new Mascota;                       // creo una mascota
                $user->tipo = $tipo;
                $user->precio = $precio;
                
                $rta = $user->save();
                if ($rta) {
                    $rta = "Se grabo la Mascota";
                    $response->getBody()->write(json_encode($rta));
                    return $response;
                }else{
                    $rta = "ERROR en grabar la Mascota";
                    $response->getBody()->write(json_encode($rta));
                    return $response;
                }
            }else{
                $response->getBody()->write(json_encode("Error de Tipos para Mascota"));
                return $response;
            }
        }else{
            $response->getBody()->write(json_encode("Error en la carga de Datos para Mascota"));
            return $response;
        }
    }
}