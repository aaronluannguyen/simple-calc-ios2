//
//  ViewController.swift
//  simple-calc
//
//  Created by Aaron Nguyen on 10/16/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  var solved = false
  var decimalUsed = false

  //Text field
  @IBOutlet weak var textField: UILabel!
  

  //Number Button Actions
  @IBAction func numbers(_ sender: UIButton) {
    resetText()
    textField.text = textField.text! + sender.currentTitle!
  }
  @IBAction func decimal(_ sender: Any) {
    if (!decimalUsed) {
      textField.text = textField.text! + "."
      decimalUsed = true
    }
  }
  
  //Function Button Actions
  @IBAction func functionEquals(_ sender: Any) {
    solveEquation()
  }
  @IBAction func functions(_ sender: UIButton) {
    textField.text = textField.text! + String(" " + sender.currentTitle! + " ")
  }
  
  //Math Functions
  public func getStringArray(_ arg: String) -> [String] {
    return arg.split(separator: " ").map({substr in String(substr)})
  }
  
  public func solveEquation() {
    let equationArray = getStringArray(textField.text!)
    switch equationArray[1] {
      case "+":
        textField.text = String(Int(equationArray[0])! + Int(equationArray[2])!)
      
      case "-":
        textField.text = String(Int(equationArray[0])! - Int(equationArray[2])!)
      
      case "x":
        textField.text = String(Int(equationArray[0])! * Int(equationArray[2])!)
      
      case "÷":
        textField.text = String(Int(equationArray[0])! / Int(equationArray[2])!)
      
      case "avg":
        var result = 0
        var numVals = 0
        for i in stride(from: 0, to: equationArray.count, by: 2) {
          result = result + Int(equationArray[i])!
          numVals += 1
        }
        textField.text = String(result / numVals)
      
      case "count":
        if (equationArray.count % 2 == 1) {
          textField.text = String(equationArray.count / 2 + 1)
        } else {
          textField.text = String(equationArray.count / 2)
        }
      case "fact":
        var answer = 1
        for i in 1...Int(equationArray[0])! {
          answer = i * answer
        }
        textField.text = String(answer)
      
      default:
        textField.text = "0"
    }
    solved = true
  }
  
  //Utility
  public func resetText() {
    if (solved) {
      textField.text = ""
      solved = false
    }
  }
}

