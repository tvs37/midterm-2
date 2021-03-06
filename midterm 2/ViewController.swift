//
//  ViewController.swift
//  midterm 2
//
//  Created by Tyler Sanchez on 3/27/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
//outlets
    @IBOutlet weak var tenPercentTipLabel: UILabel!
    @IBOutlet weak var fifthteenPercentTipLabel: UILabel!
    @IBOutlet weak var twentyPercentTipLabel: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var peoplePresent: UITextField!
    @IBOutlet weak var tenPercentSplitTip: UILabel!
    @IBOutlet weak var fifthteenPercentSpiltTip: UILabel!
    @IBOutlet weak var twentyPercentSpiltTip: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmount.delegate = self
        peoplePresent.delegate = self
        
        //listening to the keyboard
       
        // Do any additional setup after loading the view.
        
        
        
//actions
    }
    @IBAction func calculateTipButtonPressed(_ sender: Any) {
        print("tip calculated")
       hideKeyboard()
       calculateTips()

        
    }
    
    @IBAction func splitAmountButtonPressed(_ sender: Any) {
        print("tip split")
        hideKeyboard()
        spiltTip()
        
        
        
        
    }
//methods and functions
    func hideKeyboard (){
        billAmount.resignFirstResponder();
        peoplePresent.resignFirstResponder()
        
    }
  
    func calculateTips(){
        guard let subtotal = Double(billAmount.text!) else {
            print("not a number: \(billAmount.text!)")
        return
            }
       print("the subtotal is: \(subtotal)")

    
        
        // Calculate Tips
        let tip1 = calculateTip(subtotal: subtotal, tipPercentage: 10)
        let tip2 = calculateTip(subtotal: subtotal, tipPercentage: 15)
        let tip3 = calculateTip(subtotal: subtotal, tipPercentage: 20)
        
        //Update The UI
        tenPercentTipLabel.text = String(tip1)
        fifthteenPercentTipLabel.text = String(tip2)
        twentyPercentTipLabel.text = String(tip3)
        }
    
    func calculateTip(subtotal: Double, tipPercentage: Double) -> Double{
        return subtotal * (tipPercentage/100)
    

    }
        
        func spiltTip(){
        guard let spilt = Double(peoplePresent.text!) else {
            print("not a real number: \(peoplePresent.text!)")
            return
        }
        print("the spilt is: \(spilt)")
        
        //calculate spilt tip
        let tip4 = spiltTip(spilt: spilt, spiltPercentage: 10)
        let tip5 = spiltTip(spilt: spilt, spiltPercentage: 15)
        let tip6 = spiltTip(spilt: spilt, spiltPercentage: 20)
        
        //Update UI for Spilt
            tenPercentSplitTip.text = String(tip4)
            fifthteenPercentSpiltTip.text = String(tip5)
        twentyPercentSpiltTip.text = String(tip6)
        }

    func spiltTip(spilt: Double, spiltPercentage: Double) -> Double{
        return spilt * (spiltPercentage/100)
        
    }
        
    
    
//UITextFieldDelegate methods

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return pressed")
        hideKeyboard()
        return true
    }
    
}


