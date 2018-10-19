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
  
  @IBOutlet weak var endNumberBtn: UIButton!
  
  var solved = false
  var decimalUsed = false
  var solverType = 0

  //Text field
  @IBOutlet weak var textField: UILabel!
  
  //To History Button
  @IBAction func HistoryButton(_ sender: Any) {
    performSegue(withIdentifier: "CalculatorToHistory", sender: self)
  }
  
  //Toggle for solving types
  @IBAction func solverToggle(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
      case 0:
        solverType = 0
        endNumberBtn.isHidden = true
      
      case 1:
        solverType = 1
        endNumberBtn.isHidden = false
      
      default:
        break;
    }
  }
  
  //End of Number Button
  @IBAction func endNum(_ sender: Any) {
    textField.text = textField.text! + " "
  }
  
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
    if (solverType == 0) {
      textField.text = textField.text! + String(" " + sender.currentTitle! + " ")
    } else {
      textField.text = textField.text! + sender.currentTitle!
    }
    decimalUsed = false
  }
  
  //Math Functions
  public func getStringArray(_ arg: String) -> [String] {
    return arg.split(separator: " ").map({substr in String(substr)})
  }
  
  public func solveEquation() {
    let equationArray = getStringArray(textField.text!)
    if (solverType == 0) {
      switch equationArray[1] {
        case "+":
          if (Int(equationArray[0]) == nil || Int(equationArray[2]) == nil) {
            textField.text = String(Float(equationArray[0])! + Float(equationArray[2])!)
          } else {
            textField.text = String(Int(equationArray[0])! + Int(equationArray[2])!)
          }
        
        case "-":
          if (Int(equationArray[0]) == nil || Int(equationArray[2]) == nil) {
            textField.text = String(Float(equationArray[0])! - Float(equationArray[2])!)
          } else {
            textField.text = String(Int(equationArray[0])! - Int(equationArray[2])!)
          }
        
        case "x":
          if (Int(equationArray[0]) == nil || Int(equationArray[2]) == nil) {
            textField.text = String(Float(equationArray[0])! * Float(equationArray[2])!)
          } else {
            textField.text = String(Int(equationArray[0])! * Int(equationArray[2])!)
          }
        
        case "÷":
          if (Int(equationArray[0]) == nil || Int(equationArray[2]) == nil) {
            textField.text = String(Float(equationArray[0])! / Float(equationArray[2])!)
          } else {
            textField.text = String(Int(equationArray[0])! / Int(equationArray[2])!)
          }
        
        case "%":
          let num1 = Int(equationArray[0])
          let num2 = Int(equationArray[2])
          if (num1 == nil || num2 == nil) {
            textField.text = "0"
          } else {
            textField.text = String(num1! % num2!)
          }
        
        case "avg":
          var isDouble = false
          var doubleResult : Double = 0.0
          var intResult = 0
          var numVals = 0
          for i in stride(from: 0, to: equationArray.count, by: 2) {
            let numInt = Int(equationArray[i])
            if (numInt == nil) {
              let numDouble = Double(equationArray[i])!
              if (isDouble) {
                doubleResult += numDouble
              } else {
                doubleResult = Double(intResult) + numDouble
                isDouble = true
              }
            } else {
              if (isDouble) {
                doubleResult += Double(numInt!)
              } else {
                intResult += numInt!
              }
            }
            numVals += 1
          }
          if (isDouble) {
            textField.text = String(doubleResult / Double(numVals))
          } else {
            textField.text = String(intResult / numVals)
          }
        
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
    } else {
      switch equationArray[equationArray.count - 1] {
        case "+":
          if (Int(equationArray[0]) == nil || Int(equationArray[1]) == nil) {
            textField.text = String(Float(equationArray[0])! + Float(equationArray[1])!)
          } else {
            textField.text = String(Int(equationArray[0])! + Int(equationArray[1])!)
        }
        
        case "-":
          if (Int(equationArray[0]) == nil || Int(equationArray[1]) == nil) {
            textField.text = String(Float(equationArray[0])! - Float(equationArray[1])!)
          } else {
            textField.text = String(Int(equationArray[0])! - Int(equationArray[1])!)
        }
        
        case "x":
          if (Int(equationArray[0]) == nil || Int(equationArray[1]) == nil) {
            textField.text = String(Float(equationArray[0])! * Float(equationArray[1])!)
          } else {
            textField.text = String(Int(equationArray[0])! * Int(equationArray[1])!)
        }
        
        case "÷":
          if (Int(equationArray[0]) == nil || Int(equationArray[1]) == nil) {
            textField.text = String(Float(equationArray[0])! / Float(equationArray[1])!)
          } else {
            textField.text = String(Int(equationArray[0])! / Int(equationArray[1])!)
        }
        
        case "%":
          let num1 = Int(equationArray[0])
          let num2 = Int(equationArray[1])
          if (num1 == nil || num2 == nil) {
            textField.text = "0"
          } else {
            textField.text = String(num1! % num2!)
        }
        
        case "avg":
          var isDouble = false
          var doubleResult : Double = 0.0
          var intResult = 0
          var numVals = 0
          for i in stride(from: 0, to: equationArray.count-1, by: 1) {
            let numInt = Int(equationArray[i])
            if (numInt == nil) {
              let numDouble = Double(equationArray[i])!
              if (isDouble) {
                doubleResult += numDouble
              } else {
                doubleResult = Double(intResult) + numDouble
                isDouble = true
              }
            } else {
              if (isDouble) {
                doubleResult += Double(numInt!)
              } else {
                intResult += numInt!
              }
            }
            numVals += 1
          }
          if (isDouble) {
            textField.text = String(doubleResult / Double(numVals))
          } else {
            textField.text = String(intResult / numVals)
        }
        
        case "count":
          textField.text = String(equationArray.count - 1)
        
        case "fact":
          var answer = 1
          for i in 1...Int(equationArray[0])! {
            answer = i * answer
          }
          textField.text = String(answer)
        
        default:
          textField.text = "0"
      }
    }
    
    solved = true
  }
  
  //Utility
  public func resetText() {
    if (solved) {
      textField.text = ""
      solved = false
      decimalUsed = false
    }
  }
}

