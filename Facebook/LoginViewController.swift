//
//  LoginViewController.swift
//  Facebook
//
//  Created by Vicki Tan on 2/12/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var labelParentView: UIView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    var initialY2:  CGFloat!
    var offset2: CGFloat!

    
    func keyboardWillShow(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY + offset
        labelParentView.frame.origin.y = initialY2 + offset2
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY
        labelParentView.frame.origin.y = initialY2
        
    }
    
    override func viewDidLoad() {
        
        loginButton.enabled = false
        
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
            initialY = fieldParentView.frame.origin.y
            offset = -75
        
            initialY2 = labelParentView.frame.origin.y
            offset2 = -205
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func emailEdit(sender: AnyObject) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            loginButton.enabled = false
        } else {
            loginButton.enabled = true
        }
    }
    
    @IBAction func passwordEdit(sender: AnyObject) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            loginButton.enabled = false
        } else {
            loginButton.enabled = true
        }
    }
    
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
        loginButton.selected = true
        activityIndicator.startAnimating()
        
        if emailField.text == "vicki" && passwordField.text == "hello" {
            delay(2, closure: { () -> () in
                self.activityIndicator.stopAnimating()
                self.loginButton.selected = false
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
            })
        
        } else {
            delay(2, closure: { () -> () in
                self.activityIndicator.stopAnimating()
                self.loginButton.selected = false
                let alertController = UIAlertController(title: "Sorry!", message: "Something's wrong", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: nil)
                })
            }
        }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
