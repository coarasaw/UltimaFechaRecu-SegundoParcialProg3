<?php
namespace App\Controllers;
use App\Models\User;
use Clases\Usuario; 
use \Firebase\JWT\JWT;

class LoginController {

    public function add($request, $response, $args)
    {
        //Obtemos datos del body
        $dato = $request->getParsedBody();
        $usuario = $dato['usuario']?? '';
        $clave = $dato['clave']?? '';
        //Buscar email
        if($usuario <> '' && $clave <> ''){
            $count = User::where('email', '=', $usuario)->count();
            if ($count > 0) {
                $users = User::where('email', '=', $usuario)->get();
                foreach ($users as $user)
                {
                    $claveGuardada = $user->clave;
                    $emailEncontrado = $user->email;
                    $tipo = $user->tipo;
                }
                if (strcmp($usuario, $emailEncontrado) !== 0) {
                    $response->getBody()->write(json_encode("Error mayuscula, minusculas en el email"));
                    return $response;
                }else{
                    //Clave encriptada
                    $claveATratar = $clave;
                    $alt = "f#@V)Hu^%Hgfds";
                    $clave = sha1($alt.$claveATratar); 

                    if($claveGuardada == $clave){
                        //Genero Token
                        // llave
                        $key = "pro3-parcial";  
                        //Generamos el Payload-CargaDatos
                        $payload = array(
                            "iss" => "http://example.org",
                            "aud" => "http://example.com",
                            "iat" => 1356999524,               //vencimiento del token
                            "nbf" => 1357000000,
                            "email" => $usuario,
                            "clave" => $clave,
                            "tipo" => $tipo
                        );
                        $jwt = JWT::encode($payload, $key);
                        $response->getBody()->write(json_encode($jwt));
                        return $response;
                    }else{
                        $response->getBody()->write(json_encode("Clave Erronea"));
                        return $response;
                    }
                }
            }else{
                $count = User::where('nombre', '=', $usuario)->count();
                if ($count > 0) {
                    $users = User::where('nombre', '=', $usuario)->get();
                    foreach ($users as $user)
                    {
                        $claveGuardada = $user->clave;
                        $email = $user->email;
                        $nombreEncontrado = $user->nombre;
                        $tipo = $user->tipo;
                    }
                    
                    if (strcmp($usuario, $nombreEncontrado) !== 0) {
                        $response->getBody()->write(json_encode("Error mayuscula, minusculas en el nombre"));
                        return $response;
                    }else{
                        //Clave encriptada
                        $claveATratar = $clave;
                        $alt = "f#@V)Hu^%Hgfds";
                        $clave = sha1($alt.$claveATratar); 

                        if($claveGuardada == $clave){
                            //Genero Token
                            // llave
                            $key = "pro3-parcial";  
                            //Generamos el Payload-CargaDatos
                            $payload = array(
                                "iss" => "http://example.org",
                                "aud" => "http://example.com",
                                "iat" => 1356999524,               //vencimiento del token
                                "nbf" => 1357000000,
                                "email" => $email,
                                "clave" => $clave,
                                "tipo" => $tipo
                            );
                            $jwt = JWT::encode($payload, $key);   //Genero el Token
                            $response->getBody()->write(json_encode($jwt));
                            return $response;
                        }else{
                            $response->getBody()->write(json_encode("Clave Erronea"));
                            return $response;
                        }
                    }
                }else{
                    $response->getBody()->write(json_encode("NO Encontro Usuario por email/nombre"));
                    return $response;
                }
            }
        }else{    
                $response->getBody()->write(json_encode("Datos Enviados Erroneos"));
                return $response;
        }
    }
}