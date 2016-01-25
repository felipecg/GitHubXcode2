//
//  TablaUsuarioController.swift
//  T5
//
//  Created by Felipe Campos on 24-01-16.
//  Copyright © 2016 Felipe Campos Gonzalez. All rights reserved.
//

import UIKit

class TablaUsuarioController: UITableViewController {

   
   // var usuarios = [UsuarioOBJ]()
   public var usuarios: [UsuarioOBJ] = []
    var usuariosOrdenados: [String] = []
    
    public var estado : Int = 0
    public var lista: [String] = []
    
    
    
    
    var detalleUsuarios: AnyObject? {
        didSet {
            //actualizar la vista de datos
            
           //cargarDatos()
        }
    }
    
    
 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
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



        
        
    // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    // funcion para comparar un valor con el que sigue para ordenar
    func orden(value1: String, value2: String) -> Bool {
       
        return value1 < value2;
    }
    
    

    @IBAction func btnOrdenar(sender: AnyObject) {
        // cambiar estado de la bandera
        estado = 1
        
        // pasar datos de un arreglo a otro ( solo nombres para ordenar )
        for a in usuarios{
            lista.append(a.nombre)
        }
        
   //ordenar datos a traves de funcion
    lista.sortInPlace(orden)
    
    // Recargar la tabla
    tableView.reloadData()
       
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usuarios.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Lu", forIndexPath: indexPath)

        // Configure the cell...
        
       
        // llenado de datos si la bandera es 0 se cargan los datos en orden original
        if estado == 0 {
            
            let objeto = usuarios[indexPath.row]
            cell.textLabel?.text = objeto.nombre
            
        }
        
        // de no ser 0 la bandera se consulta si es 1 de ser asi ,, se muestra el arreglo ordenado
        else
        {
            if estado == 1 {
            
                    cell.textLabel?.text = lista[indexPath.row]

            }
         
            
        }
        
       

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
