//
//  ViewController.swift
//  TipCalculator
//
//  Created by SongYuda on 12/13/16.
//  Copyright © 2016 SongYuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var PercentageControl: UISegmentedControl!
    @IBOutlet weak var TotalNumLabel: UILabel!
    @IBOutlet weak var TipNumLabel: UILabel!
    @IBOutlet weak var BillFilled: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CalculateTip(_ sender: AnyObject) {
        let billNum = (Double)(BillFilled.text!) ?? 0
        let Percentage = [0.15, 0.20, 0.25]
        let tip = billNum * Percentage[PercentageControl.selectedSegmentIndex]
        TipNumLabel.text = String(format: "$%0.2f", tip)
        TotalNumLabel.text = String(format: "$%0.2f", tip+billNum)
    }

    @IBAction func OnTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
}

