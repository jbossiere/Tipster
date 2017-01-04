//
//  ViewController.swift
//  tipper
//
//  Created by Julian Bossiere on 12/31/16.
//  Copyright © 2016 Julian Bossiere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var perPersonLabel: UITextField!
    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var billView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultPercentageIndex")
        
        // FOR ANIMATION:
        if billField.text == "" {
            billView.center.y = 212
            optionsView.center.y += 100
            optionsView.alpha = 0
        } else {
            calculateTip(self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
    
        view.endEditing(true)
        
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        
        if optionsView.alpha == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.billView.center.y -= 100
                self.optionsView.center.y -= 100
                self.optionsView.alpha = 1
            })
        } else if billField.text == "" {
            UIView.animate(withDuration: 0.5, animations: {
                self.billView.center.y += 100
                self.optionsView.center.y += 100
                self.optionsView.alpha = 0
            })
        }
        
        let defaults = UserDefaults.standard
        
        let tipPercentages = [0.10, 0.15, 0.18, 0.20]
        let splitCount = [1, 2, 3, 4, 5]
        let bill = Double(billField.text!) ?? 0
        let tip: Double
        
        if defaults.string(forKey: "defaultTaxInclusion") == "Include" {
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        } else {
            tip = (bill / 1.096) * tipPercentages[tipControl.selectedSegmentIndex]
        }
        
        let total = bill + tip
        let totalWithSplit = total / Double(splitCount[splitControl.selectedSegmentIndex])
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        if splitCount[splitControl.selectedSegmentIndex] > 1 {
            totalLabel.text = String(format: "$%.2f", totalWithSplit)
            perPersonLabel.text = "per person"
        }
        if splitCount[splitControl.selectedSegmentIndex] == 1 {
            perPersonLabel.text = ""
        }
    }

    
    
    
}


