//
//  SettingsViewController.swift
//  tipper
//
//  Created by Julian Bossiere on 12/31/16.
//  Copyright © 2016 Julian Bossiere. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var percentageControl: UISegmentedControl!
    @IBOutlet weak var includeTaxControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        
        percentageControl.selectedSegmentIndex = defaults.integer(forKey: "defaultPercentageIndex")
        if defaults.string(forKey: "defaultTaxInclusion") == "Include" {
            includeTaxControl.selectedSegmentIndex = 0
        } else {
            includeTaxControl.selectedSegmentIndex = 1
        }
    }
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func setDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(percentageControl.selectedSegmentIndex, forKey: "defaultPercentageIndex")
        
        defaults.synchronize()
    }
    
    @IBAction func includeTax(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        if includeTaxControl.selectedSegmentIndex == 0 {
            defaults.set("Include", forKey: "defaultTaxInclusion")
        } else {
            defaults.set("Don't Include", forKey: "defaultTaxInclusion")
        }
        
        defaults.synchronize()
        
    }
}
