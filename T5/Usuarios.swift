//
//  Usuarios.swift
//  T5
//
//  Created by Felipe Campos on 06-01-16.
//  Copyright © 2016 Felipe Campos Gonzalez. All rights reserved.
//

import UIKit

class UsuarioOBJ: NSObject {
    
    
    var nombre: String
    var password: String
  
    
    init (nombre: String, password: String) {
        self.nombre = nombre
        self.password = password
        
        
        func datosNombre()->(String) {
            return (nombre)
        }
        func datosPass()->(String) {
            return (password)
        }
        
        func datoNombrePass ()->(String, String) {
            return (nombre,password)
        }
        
        
    }
}
