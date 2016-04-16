//
//  Atraccion.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/15/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class Atraccion: NSObject {

    var id : Int = 0
    var nombre : String = ""
    var descripcion : String = ""
    var foto = UIImage()
    var infoAtraccion = [InfoAtraccion]()
    var ubicacion = Ubicacion()
    var galeria = [UIImage]()

}

func testA()->Atraccion{

    let a = Atraccion()
    a.id = 9
    a.nombre = "Palacio de bellas artes"
    a.descripcion = "El Palacio de Bellas Artes, ubicado en el Centro Histórico de la Ciudad de México, es la casa máxima de la expresión de la cultura, el teatro lírico más relevante y el centro más importante del país dedicado a todas las manifestaciones de las bellas artes. La Unesco lo declaró monumento artístico en 1987. Bellas artes se popularizó en el siglo XVIII para referirse a las principales formas de arte que se desarrollaban por el uso de la estética, la idealización de la belleza y e Inaugurado bajo el nombre de Museo de Artes Plásticas, el 29 de septiembre de 1934, fue el primer museo dedicado a la producción plástica y también el origen indiscutible del sistema de museos de arte por ser el primer museo de arte en México. Su construcción fue encargada por el presidente mexicano Porfirio Díaz al final de su mandato, con motivo de la celebración del Centenario del Inicio de la Independencia de México. Como institución, depende del Instituto Nacional de Bellas Artes (INBA), del gobierno federal."
    a.foto = UIImage(named: "img")!
    a.ubicacion = Ubicacion()
    a.ubicacion.latitud = 19.435639
    a.ubicacion.longitud = -99.141278
    
    let a1 = InfoAtraccion()
    a1.foto = UIImage(named:"imga1")!
    a1.descripcion = "Conoce los hermosos murales que bellas artes tiene para ofrecerte"
    
    let a2 = InfoAtraccion()
    a2.foto = UIImage(named:"imga2")!
    a2.descripcion = "Dejate maravillar con el teatro, el cual cuenta con el más impresionante cortinero DEL MUNDO."
    
    let a3 = InfoAtraccion()
    a3.foto = UIImage(named:"imga3")!
    a3.descripcion = "Dejate maravillar con el teatro, el cual cuenta con el más impresionante cortinero DEL MUNDO."
    
    a.infoAtraccion.append(a1)
    a.infoAtraccion.append(a2)
    a.infoAtraccion.append(a3)
    return a
}
