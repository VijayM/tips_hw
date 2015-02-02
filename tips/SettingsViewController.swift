//
//  SettingsViewController.swift
//  tips
//
//  Created by Vijay Mani on 2/2/15.
//  Copyright (c) 2015 VM. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstTip: UITextField!
    
    @IBOutlet weak var secondTip: UITextField!
    
    @IBOutlet weak var thirdTip: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        
        firstTip.text = defaults.stringForKey("firstTip")
        secondTip.text = defaults.stringForKey("secondTip")
        thirdTip.text = defaults.stringForKey("thirdTip")
    }
    
    @IBAction func onTipChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(firstTip.text, forKey: "firstTip")
        defaults.setObject(secondTip.text, forKey: "secondTip")
        defaults.setObject(thirdTip.text, forKey: "thirdTip")
        defaults.synchronize()
    
    }
}
