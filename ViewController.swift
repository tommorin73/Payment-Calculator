//
//  ViewController.swift
//  Project1btwm0023
//
//  Created by Thomas Morin on 6/16/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loanAmt: UITextField!
    @IBOutlet weak var numPayments: UITextField!
    @IBOutlet weak var apr: UITextField!
    @IBOutlet weak var result: UITextField!
    @IBAction func calculate(_ sender: Any) {
        
        if apr.text == "" || loanAmt.text == "" || apr.text == "" {
            result.text = "error"
            return
        }
        
        let payments = Double(apr.text!)!
        let rate = Double(apr.text!)!
        let principal = Double(loanAmt.text!)!
        let calcResult = paymentCalculator(payments, rate, principal)
        
        result.text = "$ " + calcResult
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func paymentCalculator(_ months: Double, _ apr: Double, _ principle: Double)-> String {
        var payment = 0.0
        payment = (apr / 100 * principle) / (1 - pow((1 + (apr / 100)), (-1 * months)))
        return "\(round(100*payment)/100)"
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        apr.resignFirstResponder()
        loanAmt.resignFirstResponder()
        apr.resignFirstResponder()
    }
    
    //Allows the name keyboard to disappear after hitting return
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }

}

