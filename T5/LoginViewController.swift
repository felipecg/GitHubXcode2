//
//  LoginViewController.swift
//  T5
//
//  Created by Felipe Campos on 06-01-16.
//  Copyright © 2016 Felipe Campos Gonzalez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var usuarios: [UsuarioOBJ] = []
    
    var usuariosOrdenados: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //Insertar datos estaticos de Usuarios al cargar vista de Login
        
        let user1 = UsuarioOBJ(nombre: "Felipe", password: "12345")
        let user2 = UsuarioOBJ(nombre: "Profesor", password: "12345")
        let user3 = UsuarioOBJ(nombre: "Juan", password: "12345")
        let user4 = UsuarioOBJ(nombre: "Pedro", password: "12345")
        let user5 = UsuarioOBJ(nombre: "Angel", password: "12345")
        let user6 = UsuarioOBJ(nombre: "Omar", password: "12345")
        let user7 = UsuarioOBJ(nombre: "Camilo", password: "12345")
        let user8 = UsuarioOBJ(nombre: "Carlos", password: "12345")
        let user9 = UsuarioOBJ(nombre: "Alejandro", password: "12345")
        let user10 = UsuarioOBJ(nombre: "Test", password: "test")
        
        usuarios = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
       // if let indexPath = self.tableView.indexPathForSelectedRow {
          //  let object: AnyObject = usuario.obtenerUsuarios()[indexPath.row]
        
        let objeto: AnyObject = usuarios
        (segue.destinationViewController as! TablaUsuarioController).detalleUsuarios = objeto
            
        //}
    }
    
    @IBAction func btnAcceder(sender: AnyObject) {
        
        // Validar que cajas de texto no esten vacias
        
        if txtUsuario.text!.isEmpty || txtPassword.text!.isEmpty {
           
            //mensaje por patalla que estan los texto vacios
            let alertController = UIAlertController(title: "Error", message:
                "No debe dejar los textos vacios", preferredStyle: UIAlertControllerStyle.Alert)
            
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            self.txtUsuario.becomeFirstResponder()
            self.presentViewController(alertController, animated: true, completion: nil)
            return
            
        }
        
        
        
        // Busqueda de datos en arreglo
        
        for datos in usuarios {
    
        // comprobar valores ingresados con los del arreglo
            if datos.nombre == txtUsuario.text  && datos.password == txtPassword.text{
               
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let segundaVista = storyBoard.instantiateViewControllerWithIdentifier("lista") as! TablaUsuarioController
                
                self.presentViewController(segundaVista, animated:true, completion:nil)

                
                
                
                
                
                
                
                
                
                
                break
                
            }
            
        }
        
            //Mensaje por pantalla de datos no validos
            let alertController = UIAlertController(title: "Error", message:
                "Los datos no son Validos", preferredStyle: UIAlertControllerStyle.Alert)
            
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            self.txtUsuario.becomeFirstResponder()
            self.presentViewController(alertController, animated: true, completion: nil)
            
            //Limpiar las cajas de texto y setear el focus en txtUsuario
            txtUsuario.text = ""
            txtPassword.text = ""
            self.txtUsuario.becomeFirstResponder()
            
            return
        
        
    }
    
    
    @IBAction func btnLimpiar(sender: AnyObject) {
      // setear las cajas de texto a vacias
        txtUsuario.text = ""
        txtPassword.text = ""
    // setear focus en txtUsuario
        self.txtUsuario.becomeFirstResponder()
        
    }
    
  

}
