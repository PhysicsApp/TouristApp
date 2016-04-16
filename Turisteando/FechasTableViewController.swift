//
//  FechasTableViewController.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/16/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class FechasTableViewController: UITableViewController {

    var fechas = [NSDate]()
    var name = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fechas.count
    }

    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        let format = NSDateFormatter()
        format.dateStyle = .LongStyle
        format.timeStyle = .ShortStyle
        cell.textLabel?.text = format.stringFromDate(fechas[indexPath.row])
        return cell
        
    }
    
}
