//
//  AtraccionTableViewController.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/16/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class AtraccionTableViewController: UITableViewController {

    var atraccion : Atraccion! = testA()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = atraccion.nombre
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 1
        }
        
        return atraccion.infoAtraccion.count

    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("MainAtraccionTableViewCell", forIndexPath: indexPath) as! MainAtraccionTableViewCell
            cell.mainImage.image = atraccion.foto
            cell.mainLabel.text = atraccion.descripcion
            return cell
            
        }
        else{
        
            let cell = tableView.dequeueReusableCellWithIdentifier("SecondaryAttraction", forIndexPath: indexPath) as! SecondaryAtraccionTableViewCell
            cell.attractionText.text = atraccion.infoAtraccion[indexPath.row].descripcion
            cell.attractionImage.image = atraccion.infoAtraccion[indexPath.row].foto
            return cell
            
        }
        // Configure the cell...
    }
    

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 1{
            return "Atractivo turistico"
        }
        
        return " "
        
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
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
