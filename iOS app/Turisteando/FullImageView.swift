//
//  FullImageView.swift
//  bondzuios
//
//  Created by Ricardo Lopez Focil on 9/9/15.
//  Copyright © 2015 Bondzu. All rights reserved.
//  Archivo Localizado

import UIKit

class FullImageViewController: UIViewController, UINavigationControllerDelegate{
    
    private weak var fullImageView : FullImageView?
    
    
    func loadImage(image : UIImage){
        fullImageView?.image = image
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        
        self.modalTransitionStyle = .FlipHorizontal
        setNeedsStatusBarAppearanceUpdate()
        view = UIImageView(image: captureScreen())
        view.userInteractionEnabled = true
        let fiv =  FullImageView()
        fullImageView = fiv
        fullImageView!.delegate = self
        self.view.addSubview(fullImageView!)
    }
    
    func dismiss(){
        fullImageView!.delegate = nil
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    class FullImageView : UIView{

        var button = UIButton()
        
        var delegate : FullImageViewController?
        
        
        var imageview = UIImageView()
        var bgImage = UIImageView()

        private var activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        private var blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        
        init(){
            super.init(frame: UIScreen.mainScreen().bounds)
            load()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            load()
        }
        
        
        //TODO Version 2 Agregar un dismisal al bajar el dedo
        
        func dismiss(){
            print("DISMISEANDO");
            delegate?.dismiss()
        }
        
        func load(){
            
            /*if let w = UIApplication.sharedApplication().keyWindow{
                w.addSubview(self)
                self.frame = CGRect(x: 0, y: 0, width: w.bounds.width, height: w.bounds.height)
            }*/
            
            button.setTitle(NSLocalizedString("Done", comment: ""), forState: UIControlState.Normal)
            button.addTarget(self, action: "dismiss", forControlEvents: UIControlEvents.TouchUpInside)
            
            button.setTitleColor(UIColor.blueColor(), forState: .Normal)
            
            activityIndicatorView.hidesWhenStopped = true
            bgImage.contentMode = .ScaleAspectFill
            imageview.contentMode = .ScaleAspectFit
            
            addSubview(bgImage)
            addSubview(blur)
            addSubview(activityIndicatorView)
            addSubview(button)
            addSubview(imageview)
        }
        
        
        var image : UIImage?{
            get{
                return imageview.image
            }
            set{
                imageview.image = newValue
                setNeedsLayout()
            }
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.frame = superview!.frame
            bgImage.frame = frame
            blur.frame = frame
            
            button.sizeToFit()
            button.frame.origin = CGPoint(x: 10, y: 10)
            
            if imageview.image != nil{
                activityIndicatorView.stopAnimating()
                let orientation = UIDevice.currentDevice().orientation
                
                if orientation == .Portrait || orientation == .FaceUp || orientation == .FaceDown{
                    
                    button.hidden = false
                    
                    let frh = frame.height
                    
                    let fw = frame.width
                    let fh = frh - (button.frame.height + 5) * 2
                    
                    let iw = imageview.image!.size.width
                    let ih = imageview.image!.size.width
                    
                    if(iw < fw && ih < fh){
                        imageview.frame = CGRect(x: fw/2 - iw/2, y: frh/2 - ih/2, width: iw, height: ih)
                    }
                    else{
                        let dw = iw - fw
                        let dh = ih - fh
                        
                        if dw < dh{
                            
                            let nih = fh
                            let niw = fh * iw / ih
                            
                            imageview.frame = CGRect(x: fw/2 - niw/2, y: frh/2 - nih/2, width: niw, height: nih)
                            
                        }
                        else{
                            
                            let niw = fw
                            let nih = fw * ih / iw
                            
                            imageview.frame = CGRect(x: fw/2 - niw/2, y: frh/2 - nih/2, width: niw, height: nih)
                        }
                    }
                }
                else{
                    button.hidden = true
                    imageview.contentMode = .ScaleAspectFit
                    imageview.frame = CGRect(origin: CGPointZero, size: frame.size)
                }
                
            }
            else{
                activityIndicatorView.startAnimating()
                activityIndicatorView.frame = CGRect(x: frame.size.width/2 - 100, y: frame.size.height/2 - 100, width: 200, height: 200)
            }
        
        }
        
        func renderForDismiss(){
            let view = UIScreen.mainScreen().snapshotViewAfterScreenUpdates(false)
            view.frame = self.frame
            addSubview(view)
            imageview.hidden = true
            bgImage.hidden = true
            blur.hidden = true
        }

    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.AllButUpsideDown
    }
    
    override func dismissViewControllerAnimated(flag: Bool, completion: (() -> Void)?) {
        fullImageView?.renderForDismiss()
        super.dismissViewControllerAnimated(flag, completion: completion)
    }
    
}

func captureScreen() -> UIImage {
    var window: UIWindow? = UIApplication.sharedApplication().keyWindow
    window = UIApplication.sharedApplication().windows[0]
    UIGraphicsBeginImageContextWithOptions(window!.frame.size, window!.opaque, 0.0)
    window!.layer.renderInContext(UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image;
}
