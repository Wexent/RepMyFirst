//
//  ViewController.swift
//  Calculater
//
//  Created by Аюша on 27.05.17.
//  Copyright © 2017 Аюша. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayresultlabel: UILabel!
    var stillTyping = false
    var dotisplaced = false
    var firstoperand: Double = 0
    var secondoperand: Double = 0
    var operationsign: String = ""
    var percentoperand: Double = 0
    
    var currentinput: Double {
        get {
            return Double(displayresultlabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayresultlabel.text = "\(valueArray[0])"
            } else {
                displayresultlabel.text = "\(newValue)"
                   }
            stillTyping = false
        }
        
    
        }
    
   @IBAction func numberpressed(_ sender: UIButton) {
    
        let Number = sender.currentTitle;
        if stillTyping {
            if (displayresultlabel.text?.characters.count)! < 20 {
            displayresultlabel.text = displayresultlabel.text! + Number!}
        }else{
            displayresultlabel.text = Number
            stillTyping = true
        }
        }
    
    @IBAction func twooperandsignpressed(_ sender: UIButton) {
    operationsign = sender.currentTitle!
    firstoperand = currentinput
    stillTyping = false
    dotisplaced = false
 }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentinput = operation(firstoperand, secondoperand)
        stillTyping = false
    }
    
    @IBAction func equalitysignpressed(_ sender: UIButton) {
        if stillTyping {
            
            secondoperand = currentinput
            }else {
                secondoperand = percentoperand
            }
        jdsgjdksljgkdsjkgjdsgjdksjgls
    
        dotisplaced = false
        
        switch operationsign {
            case "+":
                operateWithTwoOperands{$0 + $1}
            case "-":
                operateWithTwoOperands{$0 - $1}
            case "×":
                operateWithTwoOperands{$0 * $1}
            case "÷":
                operateWithTwoOperands{$0 / $1}
        default : break
        }
    }
    
    
    @IBAction func clearbuttonpressed(_ sender: UIButton) {
        firstoperand = 0
        secondoperand = 0
        currentinput = 0
        displayresultlabel.text = "0"
        dotisplaced = false
        stillTyping = false
        operationsign = ""
    }
    
    
    @IBAction func plusminusbuttonpressed(_ sender: UIButton) {
        currentinput = -currentinput
    }

    @IBAction func percentbuttonpress(_ sender: UIButton) {
        percentoperand = firstoperand / 100 * currentinput
    }
    
    @IBAction func squarerootbuttonpressed(_ sender: UIButton) {
        currentinput = sqrt(currentinput)
    }
    
    @IBAction func dotbuttonpressed(_ sender: UIButton) {
        if stillTyping && !dotisplaced {
            displayresultlabel.text = displayresultlabel.text! + "."
            dotisplaced = true
        } else if !stillTyping && !dotisplaced{
            displayresultlabel.text = "0."
            dotisplaced = true
        }
    }
    
}

