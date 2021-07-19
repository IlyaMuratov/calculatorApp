//
//  ViewController.swift
//  Calculator
//
//  Created by Admin on 18.07.2021.
//

import UIKit

class ViewController: UIViewController {

    var digitsDouble: Double = 0
    var firstNumber: Double = 0
    var operation: Int = 0
    var mathSign: Bool = false
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        } else {
            result.text = result.text! + String(sender.tag)
        }

        digitsDouble = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 11{
            firstNumber = Double(result.text!)!
            
            if sender.tag == 15 { //деление
                result.text = "/"
            }
            if sender.tag == 14 { //умножение
                result.text = "x"
            }
            if sender.tag == 13 { //вычитание
                result.text = "-"
            }
            if sender.tag == 12 { //сложение
                result.text = "+"
            }
            
            mathSign = true
            operation = sender.tag
        } else if sender.tag == 11 { //равно
            if operation == 15 {
                result.text = String(firstNumber / digitsDouble)
            }
            else if operation == 14 {
                result.text = String(firstNumber * digitsDouble)
            }
            else if operation == 13 {
                result.text = String(firstNumber - digitsDouble)
            }
            else if operation == 12 {
                result.text = String(firstNumber + digitsDouble)
            }
        }
        else if sender.tag == 10 {
            result.text = ""
            firstNumber = 0
            digitsDouble = 0
            operation = 0
            
        }
    
        func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
}
