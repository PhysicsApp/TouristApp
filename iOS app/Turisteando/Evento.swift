//
//  Evento.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/15/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class Evento{
    
    var id : Int = 0
    var nombre : String = ""
    var descripcion : String = ""
    var ubicacion = Ubicacion()
    var fechas = [NSDate]()
    var foto = UIImage()
    
}

func teste()->Evento{
    
    let e = Evento()
    e.id = 2
    e.nombre = "Asher Davila en concierto"
    e.descripcion = "Asher davila es un artista con muchos años de eperiencia en el arte del ligue.\nHa realizado diferentes trabajos y un par de novelas. Actualmente se dedica a escribir canciones de amor y ha llenado toda su gira de conciertos hasta ahora"
    e.fechas.append( NSDate(timeInterval: 3600 * 24, sinceDate: NSDate()) )
    e.fechas.append( NSDate(timeInterval: 7200 * 24, sinceDate: NSDate()) )
    e.foto = UIImage(named: "adav")!
    e.ubicacion.latitud = 19.058009
    e.ubicacion.longitud = -98.182213
    return e
}