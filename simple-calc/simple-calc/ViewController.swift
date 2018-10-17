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

  //Text field
  @IBOutlet weak var textField: UILabel!
  

  //Number Button Actions
  @IBAction func number0(_ sender: Any) {
    textField.text = textField.text! + "0"
  }
  @IBAction func number1(_ sender: Any) {
    textField.text = textField.text! + "1"
  }
  @IBAction func number2(_ sender: Any) {
    textField.text = textField.text! + "2"
  }
  @IBAction func number3(_ sender: Any) {
    textField.text = textField.text! + "3"
  }
  @IBAction func number4(_ sender: Any) {
    textField.text = textField.text! + "4"
  }
  @IBAction func number5(_ sender: Any) {
    textField.text = textField.text! + "5"
  }
  @IBAction func number6(_ sender: Any) {
    textField.text = textField.text! + "6"
  }
  @IBAction func number7(_ sender: Any) {
    textField.text = textField.text! + "7"
  }
  @IBAction func number8(_ sender: Any) {
    textField.text = textField.text! + "8"
  }
  @IBAction func number9(_ sender: Any) {
    textField.text = textField.text! + "9"
  }
  @IBAction func decimal(_ sender: Any) {
    textField.text = textField.text! + "."
  }
  
  //Function Button Actions
  @IBAction func functionEquals(_ sender: Any) {
  }
  @IBAction func functionAdd(_ sender: Any) {
    textField.text = textField.text! + " + "
  }
  @IBAction func functionSubtract(_ sender: Any) {
    textField.text = textField.text! + " - "
  }
  @IBAction func functionMultiply(_ sender: Any) {
    textField.text = textField.text! + " * "
  }
  @IBAction func functionDivide(_ sender: Any) {
    textField.text = textField.text! + " / "
  }
  @IBAction func functionAverage(_ sender: Any) {
    textField.text = textField.text! + " avg "
  }
  @IBAction func functionCount(_ sender: Any) {
    textField.text = textField.text! + " count "
  }
  @IBAction func functionFactorial(_ sender: Any) {
    textField.text = textField.text! + " fact "
  }
}

