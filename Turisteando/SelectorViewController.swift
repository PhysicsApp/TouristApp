//
//  SelectorViewController.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/15/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class SelectorViewController: UITableViewController{

    
    var tipo : Tipo!
    var loading = true
    
    
    let atraccionesStiring = ["Cholula", "Tehuacan", "Catedral de Puebla", "Museo del barroco", "Estrella de Puebla", "Barrio del artista", "Plazuela de los sapos", "La pasita", "Africam Safari", "La calle de los dulces"]
    let eventosString = ["Como una Reina", "Feria de Puebla 2016", "Noche de museos", "Luchas libre en Puebla", "Chayanne"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = tipo == Tipo.Atracciones ? "Atracciones" : tipo == Tipo.Eventos ? "Eventos" : "Sugerencias"
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
            sleep(1)
            dispatch_async(dispatch_get_main_queue()){
                self.loading = false
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if loading{
            return 0
        }
        
        return tipo == Tipo.Sugerencias ? 2 : 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if loading{
            return 1
        }
        if tipo == Tipo.Atracciones || tipo == Tipo.Sugerencias{
            return 10
        }
        else if tipo == Tipo.Eventos{
            return 5
        }
        else{
            return 15
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if loading{
            return tableView.dequeueReusableCellWithIdentifier("loading")!
        }
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "")
    
        if tipo == Tipo.Atracciones || tipo == Tipo.Sugerencias{

            cell.textLabel?.text = self.atraccionesStiring[indexPath.row]
            cell.imageView?.image = UIImage(named: "a\(indexPath.row + 1)")

        }
        else if tipo == Tipo.Eventos{
            cell.textLabel?.text = eventosString[indexPath.row]
            cell.imageView?.image = UIImage(named: "e\(indexPath.row + 1)")

        }
        else{
            cell.textLabel?.text =  "Sugerencia \(indexPath.row + 1)"
        }
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if tipo == Tipo.Atracciones{
            performSegueWithIdentifier("sta", sender: self)
        }
        else if tipo == Tipo.Eventos || tipo == Tipo.Sugerencias{
            performSegueWithIdentifier("ste", sender: self)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)

        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
