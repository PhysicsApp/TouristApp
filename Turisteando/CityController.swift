//
//  CityController.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/15/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class CityController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate{

    @IBOutlet weak var descripcionCiudad: UITextView!
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        self.navigationItem.title = "Puebla"
        descripcionCiudad.text = "Puebla es una de las 32 entidades federativas de México. Se localiza en el centro oriente del territorio mexicano. Colinda al este con el estado de Veracruz, al poniente con los estados de Hidalgo, México, Tlaxcala y Morelos y al sur con los estados de Oaxaca y Guerrero. Puebla no tiene salida al mar y presenta un relieve sumamente accidentado. Su superficie es de 34.306 km², en la cual viven más de cinco millones de personas, que convierten a este estado en el quinto más poblado del país. La capital del estado es Puebla de Zaragoza, la cuarta ciudad mexicana por el número de sus habitantes.\n" +
        "El estado de Puebla ha sido de gran importancia en la historia de México. Dentro de él se han hallado los restos más antiguos del cultivo de maíz y camotes en la región de Tehuacán; fue el escenario de ciudades prehispánicas tan importantes como Cantona y Cholula. Durante la época virreinal, la ciudad de Puebla llegó a ser la segunda ciudad en importancia de la Nueva España, gracias a su ubicación estratégica entre la Ciudad de México y el puerto de Veracruz.\n" +
       
        "A finales del siglo XIX, el estado fue uno de los primeros en industrializarse, gracias a la introducción de telares mecánicos que favorecieron el desarrollo de las actividades textiles. A pesar de todo ello, en fechas más recientes, municipios de las regiones Mixteca, de la Sierra Norte y de la Sierra Negra se han convertido en expulsores netos de población, cuyos destinos principales son la Ciudad de México, y desde hace dos décadas a los Estados Unidos."
        loadingIndicatorView.stopAnimating()
        loadingIndicatorView.hidden = true
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: (collectionView.frame.width - 16) / 2, height: (collectionView.frame.width - 16) / 2)
        collectionView.backgroundView?.backgroundColor = UIColor.clearColor()
        collectionView.backgroundColor = UIColor.clearColor()
        return 1
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let normalCell = collectionView.dequeueReusableCellWithReuseIdentifier("normalCell", forIndexPath: indexPath) as! GaleriaCelda
        
        let letter = indexPath.row < 10 ? "a" : "e"
        
        normalCell.imageView.image = UIImage(named: "\(letter)\(indexPath.row + 1)")!
        
        return normalCell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let i = FullImageViewController()
        i.modalTransitionStyle = .CoverVertical
        i.transitioningDelegate = self
        self.parentViewController!.presentViewController(i, animated: true, completion: nil)
        i.loadImage( UIImage(named: "img")! )
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        func getSelector()->SelectorViewController{
            return segue.destinationViewController as! SelectorViewController
        }
        
        if segue.identifier == "eventos"{
            getSelector().tipo = Tipo.Eventos
        }
        else if segue.identifier == "atracciones"{
            getSelector().tipo = Tipo.Atracciones
        }
        else if segue.identifier == "sugerencias"{
            getSelector().tipo = Tipo.Sugerencias
        }
        
    }
}
