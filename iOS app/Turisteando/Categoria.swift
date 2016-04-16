//
//  Categoria.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/15/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class Categoria: NSObject {

    var id : Int = 0
    var nombre = ""
    var subcategoria = [Subcategoria]()

}

func testCategories() -> [Categoria]{
    var categories = [Categoria]()
    var sub : Subcategoria!
    
    let arte = Categoria()
    arte.id = 1
    arte.nombre = "Arte"
    
    sub = Subcategoria()
    sub.id = 1
    sub.nombre = "Cine"
    
    arte.subcategoria.append(sub)
    
    sub = Subcategoria()
    sub.id = 2
    sub.nombre = "Pintura"
    
    arte.subcategoria.append(sub)

    sub = Subcategoria()
    sub.id = 20
    sub.nombre = "Escultura"
    
    arte.subcategoria.append(sub)

    sub = Subcategoria()
    sub.id = 3
    sub.nombre = "Arquitectura"
    
    arte.subcategoria.append(sub)

    let deportes = Categoria()
    deportes.id = 2
    deportes.nombre = "Deportes"
    
    sub = Subcategoria()
    sub.id = 4
    sub.nombre = "Aire libre"
    
    deportes.subcategoria.append(sub)
    
    sub = Subcategoria()
    sub.id = 5
    sub.nombre = "Extremos"
    
    deportes.subcategoria.append(sub)
    
    sub = Subcategoria()
    sub.id = 6
    sub.nombre = "Agilidad mental"
    
    deportes.subcategoria.append(sub)
    
    
    categories.append(arte)
    categories.append(deportes)
 
    return categories
}