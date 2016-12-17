//
//  ViewController.swift
//  TipCalculator
//
//  Created by SongYuda on 12/13/16.
//  Copyright © 2016 SongYuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

let defaults = UserDefaults.standard
    
@IBOutlet weak var PercentageControl: UISegmentedControl!
    @IBOutlet weak var TipNum: UILabel!
    @IBOutlet weak var TotalNumLabel: UILabel!
    @IBOutlet weak var BillFilled: UITextField!
    @IBOutlet weak var SplitedNum: UILabel!
    @IBOutlet weak var Split: UIStepper!
    var Percentage = [0.10, 0.15, 0.20]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        defaults.synchronize()
        
        let defaultIndex = defaults.integer(forKey: "Index2")
        
        PercentageControl.selectedSegmentIndex = defaultIndex
        if(defaults.array(forKey: "Percentages") == nil) {
            Percentage = [0.10, 0.15, 0.20]
        }
        else {
        Percentage = defaults.array(forKey: "Percentages") as! [Double]
        }
        
        for i in 0..<3 {
            PercentageControl.setTitle("\((Int)(Percentage[i]*100))%", forSegmentAt: i)
        }
        
        let billNum = (Double)(BillFilled.text!) ?? 0
        let tip = billNum * Percentage[PercentageControl.selectedSegmentIndex]
        
        TipNum.text = String(format: "Tips: $%0.2f", tip)
        
        if(Split.value == 1) {
            TotalNumLabel.text = String(format: "$%0.2f", tip+billNum)
        }
        else {
            TotalNumLabel.text = String(format: "$%0.2f", tip+billNum) + "/\((Int)(Split.value))"
        }
        SplitedNum.text = String(format: "$%0.2f", (tip+billNum)/Split.value )
    }
    

    @IBAction func ChangeSplit(_ sender: AnyObject) {
        let billNum = (Double)(BillFilled.text!) ?? 0
        
        let tip = billNum * Percentage[PercentageControl.selectedSegmentIndex]
        TipNum.text = String(format: "Tips: $%0.2f", tip)
        
        if(Split.value == 1) {
            TotalNumLabel.text = String(format: "$%0.2f", tip+billNum)
        }
        else {
            TotalNumLabel.text = String(format: "$%0.2f", tip+billNum) + "/\((Int)(Split.value))"
        }
        SplitedNum.text = String(format: "$%0.2f", (tip+billNum)/Split.value )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BillFilled.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CalculateTip(_ sender: AnyObject) {
        let billNum = (Double)(BillFilled.text!) ?? 0
        
        let tip = billNum * Percentage[PercentageControl.selectedSegmentIndex]
        TipNum.text = String(format: "Tips: $%0.2f", tip)
        if(Split.value == 1) {
            TotalNumLabel.text = String(format: "$%0.2f", tip+billNum)
        }
        else {
            TotalNumLabel.text = String(format: "$%0.2f", tip+billNum) + "/\((Int)(Split.value))"
        }
        SplitedNum.text = String(format: "$%0.2f", (tip+billNum)/Split.value )
    }

    @IBAction func OnTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
}

