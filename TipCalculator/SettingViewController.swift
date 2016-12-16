//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by SongYuda on 12/16/16.
//  Copyright © 2016 SongYuda. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var tipController: UISegmentedControl!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        if(tipController.selectedSegmentIndex == 0) {
            defaults.set([0.1,0.15,0.2], forKey: "Percentages")
            defaults.set(0, forKey: "Index")
            defaults.synchronize()
        }
        if(tipController.selectedSegmentIndex == 1) {
            defaults.set([0.15,0.18,0.2], forKey: "Percentages")
            defaults.set(1, forKey: "Index")
            defaults.synchronize()
        }
        if(tipController.selectedSegmentIndex == 2) {
            defaults.set([0.18,0.2,0.25], forKey: "Percentages")
            defaults.set(2, forKey: "Index")
            defaults.synchronize()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        defaults.synchronize()
        
        let index = defaults.integer(forKey: "Index")
        tipController.selectedSegmentIndex = index
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
