//
//  OSDOutput.swift
//  Secure Sign In
//
//  Created by Zander Labuschagne on 2015/12/30.
//  Copyright © 2015 Cryon Software. All rights reserved.
//

import UIKit

class OSDOutput: UIViewController
{
    var password = [Character]();
    var status = 0;
    var str = "";
    
    @IBOutlet weak var pswPassword: UITextField!
    @IBOutlet weak var btnUnhide: UIButton!
    
    override func viewDidLoad()
    {
        for _ in password
        {
            str += "*";
        }
        self.pswPassword.text = str;
        super.viewDidLoad();
        status = 0;

        // Do any additional setup after loading the view.
    }
    @IBAction func btnHide(sender: AnyObject)
    {
        if status == 0
        {
            btnUnhide.setTitle("Hide Password", forState: UIControlState.Focused);
            status = 1;
            pswPassword.text = (String)(password);
        }
        else
        {
            btnUnhide.setTitle("Reveal Password", forState: UIControlState.Focused);
            status = 0;
            pswPassword.text = str;
            self.pswPassword.font = UIFont(name: "PT Mono", size: 12);
        }

    }
    @IBAction func btnCopy(sender: AnyObject)
    {
        UIPasteboard.generalPasteboard().string = (String)(password);
        self.dismissViewControllerAnimated(true, completion: {});

    }

    @IBAction func btnOK(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    override func didReceiveMemoryWarning()
    {
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
