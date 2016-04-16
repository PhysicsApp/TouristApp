//
//  RegistroViewController.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/16/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class RegistroViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    var categories : [(Categoria,Bool)]! = nil
    
    var selectedSubcategories = [Int]()
    
    var gr : UITapGestureRecognizer?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        categories = [(Categoria, Bool)]()
        for i in testCategories(){
            categories.append((i,false))
        }
                
    }

    func finish(){
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if categories[section].1{
            return categories[section].0.subcategoria.count + 1
        }
        else{
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(indexPath.row == 0 ? "cat" : "sub") as! TableViewCell
        
        if indexPath.row == 0{
            
            cell.label.text = categories[indexPath.section].0.nombre
            cell.accessoryType = .None
            
        }
        else{
        
            let categoria = categories[indexPath.section].0
            cell.label.text = categoria.subcategoria[indexPath.row - 1].nombre
            cell.accessoryType = selectedSubcategories.contains(categoria.subcategoria[indexPath.row - 1].id) ? .Checkmark : .None
        
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        if indexPath.row == 0{
            
            categories[indexPath.section].1 = !categories[indexPath.section].1
            
        }
        else{
            
            let categoria = categories[indexPath.section].0
            let subcat = categoria.subcategoria[indexPath.row - 1]
            
            if let index = selectedSubcategories.indexOf(subcat.id){
                selectedSubcategories.removeAtIndex(index)
            }
            else{
                selectedSubcategories.append(subcat.id)
            }
            
        }
        
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return indexPath
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        let gr = UITapGestureRecognizer(target: self, action: #selector(RegistroViewController.finish))
        self.view.addGestureRecognizer(gr)
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if let gr = self.gr{
            self.gr = nil
            self.view.removeGestureRecognizer(gr)
        }
    }
    
    @IBAction func cancelRegistry(sender: AnyObject) {
        
    self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
}
