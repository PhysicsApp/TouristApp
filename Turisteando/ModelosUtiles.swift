//
//  ModelosUtiles.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/15/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

enum Dias : Int{

    case Domingo = 0, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado
    
}


enum Tipo{
    
    case Eventos
    case Sugerencias
    case Atracciones
    
}

let URL = "http://192.10.20.246/"
let token = "a=\(String("Los Alienigenas Nos Atacan").stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()))"