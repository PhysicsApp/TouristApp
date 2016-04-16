//
//  Estado.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/15/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class Estado: NSObject {
    
    let id = 0
    let nombre : String = ""
    let ciudades = [Ciudad]()
    weak var pais : Pais!
    
}
