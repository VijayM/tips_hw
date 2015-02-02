//
//  ViewController.swift
//  tips
//
//  Created by VM on 2/2/15.
//  Copyright (c) 2015 VM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercentageControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipString = (tipPercentageControl.titleForSegmentAtIndex(tipPercentageControl.selectedSegmentIndex))!
        
        var tipPercentage = NSString(string: tipString).doubleValue / 100.0
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var notSet = defaults.objectForKey("firstTip") == nil
        
        if(notSet){
            var tipPercentages = ["15", "18", "20"]
            defaults.setObject(tipPercentages[0], forKey: "firstTip")
            defaults.setObject(tipPercentages[1], forKey: "secondTip")
            defaults.setObject(tipPercentages[2], forKey: "thirdTip")
            defaults.synchronize()
        }
        
        var firstTip = defaults.objectForKey("firstTip") as String
        tipPercentageControl.setTitle(
            "\(firstTip)%", forSegmentAtIndex: 0)
        
        var secondTip = defaults.objectForKey("secondTip") as String
        tipPercentageControl.setTitle(
            "\(secondTip)%", forSegmentAtIndex: 1)
        
        var thirdTip = defaults.objectForKey("thirdTip") as String
        tipPercentageControl.setTitle(
            "\(thirdTip)%", forSegmentAtIndex: 2)
    }
}

