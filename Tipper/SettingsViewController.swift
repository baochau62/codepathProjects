//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Nguyen, Bao-Chau on 3/12/17.
//  Copyright © 2017 Intuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tipPickerView: UIPickerView!
    var pickerData : [String] = [String]()
    let defaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // add default data to tip list
        pickerData = ["10", "15", "20", "22"]
        self.tipPickerView.delegate = self
        self.tipPickerView.dataSource = self
        if let row = pickerData.index(of: selectedTip) {
            
            tipPickerView.selectRow(row, inComponent: 0, animated: false)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // there is only 1 column
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        defaults.set(pickerData[row], forKey:"selectedRow")
        
    }
    
    var selectedTip: String {
        return UserDefaults.standard.object(forKey: "selectedRow") as! String
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
