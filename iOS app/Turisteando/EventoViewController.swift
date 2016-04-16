//
//  EventoViewController.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/16/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class EventoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var descripcion: UITextView!
    
    var evento : Evento! = teste()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imageView.image = evento.foto
        eventTitle.text = evento.nombre
        descripcion.text = evento.descripcion
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "fecha"{
            let vc = segue.destinationViewController as! FechasTableViewController
            vc.fechas = evento.fechas
            vc.name = evento.nombre
        }
    }
    
}
