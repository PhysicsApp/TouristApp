//
//  LoginViewController.swift
//  Turisteando
//
//  Created by Ricardo Lopez Focil on 4/16/16.
//  Copyright © 2016 TacOS. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var contraseniaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.finish)))
        // Do any additional setup after loading the view.
    }
    
    func finish(){
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func entrar(sender: AnyObject) {
        
        let post = "\(token)funcion=login&mail=\(usuarioTextField.text?.prepare())&password=\(contraseniaTextField.text?.prepare())"
        let request = NSMutableURLRequest(URL: NSURL(string: "\(URL)controller.php")!)
        let postLength = "\(post.characters.count)"
        request.HTTPMethod = "POST"
        request.setValue(postLength, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("apiuser", forHTTPHeaderField: "X-USERNAME")
        request.HTTPBody = post.dataUsingEncoding(NSUTF8StringEncoding)
        
        
        let t = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration()).dataTaskWithRequest(request){
            data, reponsem, error in
            let s = String(data: data!, encoding: NSUTF8StringEncoding)
            print(s)
        }
        
        //t.resume()
       
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToMainScreen(segue : UIStoryboardSegue){}

}

extension String{
    func prepare() -> String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
    }
}