//
//  ViewController.swift
//  finalTipApp
//
//  Created by Adnan Ali Lone on 12/30/15.
//  Copyright © 2015 Adnan Ali Lone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //*********
    
    override func viewDidAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = defaults.integerForKey("index")
        
        var tipPercentages = [0.18, 0.20, 0.22]
        tipControl.selectedSegmentIndex = index
        
        calculateTipAndTotal(tipPercentages[index])
        
        
        
    }
    
//**********
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.20, 0.22]
        let percentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        calculateTipAndTotal(percentage)
        
      
        
        
    }

    //*****
    func calculateTipAndTotal(percentage: Double){
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * percentage
        let total = tip + billAmount
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f",total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
}

