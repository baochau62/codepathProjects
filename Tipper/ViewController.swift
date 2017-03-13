//
//  ViewController.swift
//  Tipper
//
//  Created by Nguyen, Bao-Chau on 3/12/17.
//  Copyright © 2017 Intuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        print ("setting tip percentages")
        // loading the tip percentage from user defaults
        let defaults = UserDefaults.standard
        let stringValue = defaults.object(forKey: "selectedRow") as? String ?? "10"
        switch (stringValue) {
            case "10":
                tipControl.selectedSegmentIndex = 0
            
            case "15":
                tipControl.selectedSegmentIndex = 1
            
            case "20":
                tipControl.selectedSegmentIndex = 2
            
            case "22":
                tipControl.selectedSegmentIndex = 3
            
        default:
            tipControl.selectedSegmentIndex = 0
        }
        calculateTip(Any)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }


  
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.1, 0.15,0.2, 0.22]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

