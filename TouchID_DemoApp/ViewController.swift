//
//  ViewController.swift
//  TouchID_DemoApp
//
//  Created by HigherVisibility on 18/10/2018.
//  Copyright © 2018 ahmedHigherVisibility. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var successLabel:UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        
        
        
        
    }

    
    @IBAction func touchIdAction(_ sender: UIButton) {
        
        print("hello there!.. You have clicked the touch ID")
        
        let myContext = LAContext()
        let myLocalizedReasonString = "Biometric Authntication testing !! "
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    print(evaluateError)
                    
                    DispatchQueue.main.async {
                        if success {
                            
                            // User authenticated successfully, take appropriate action
                            self.successLabel?.text = "Awesome!!... User authenticated successfully"
                            
                            
                        } else {
                            // User did not authenticate successfully, look at error and take appropriate action
                            self.successLabel?.text = "Sorry!!... User did not authenticate successfully"
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                successLabel?.text = "Sorry!!.. Could not evaluate policy."
            }
        } else {
            // Fallback on earlier versions
            
            successLabel?.text = "Ooops!!.. This feature is not supported."
        }
        
        
    }

    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

