//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var numOfPayments: UITextField!
    @IBOutlet weak var interestRate: UITextField!
    @IBOutlet weak var result: UITextField!
    @IBAction func calculate(_ sender: Any) {
        
        if numOfPayments.text == "" || amount.text == "" || interestRate.text == "" {
            result.text = ""
            return
        }
        
        let payments = Double(numOfPayments.text!)!
        let rate = Double(interestRate.text!)!
        let principal = Double(amount.text!)!
        
        let resultFromCalc = paymentCalculator(payments, rate, principal)
        
        result.text = "$ " + resultFromCalc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = ""
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask(rawValue: (UIInterfaceOrientationMask.portrait.rawValue | UIInterfaceOrientationMask.landscapeLeft.rawValue | UIInterfaceOrientationMask.landscapeRight.rawValue))
    }
    
    
    func paymentCalculator(_ months: Double, _ apr: Double, _ loanAmount: Double)-> String {
        var payment = 0.0
        payment = (apr / 100 * loanAmount) / (1 - pow((1 + (apr / 100)), (-1 * months)))
        
        return "\(round(100 * payment) / 100)"
    }
}

