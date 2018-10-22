//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Aaron Nguyen on 10/19/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()

      let history = getHistoryArray()
      populateHistoryScrollView(history)
  }

  //To Calculator Button
  @IBAction func CalculatorButton(_ sender: Any) {
    performSegue(withIdentifier: "HistoryToCalculator", sender: self)
  }

  //Scroll View
  @IBOutlet weak var HistoryScrollView: UIScrollView!
  
  //Gets history array from UserDefautls
  public func getHistoryArray() -> [String] {
    let defaults = UserDefaults.standard
    return defaults.object(forKey: "HistoryArray") as? [String] ?? [String]()
  }
  
  //Populate Scroll View with history labels
  public func populateHistoryScrollView(_ args: [String]) {
    var height:CGFloat = 0
    var contentRect = CGRect.zero
    for i in args.reversed() {
      let label = UILabel()
      label.text = i
      label.textColor = UIColor.white
      label.backgroundColor = UIColor.gray
      label.frame = CGRect(x: 0, y: height, width: HistoryScrollView.frame.width, height: 20)
      label.heightAnchor.constraint(equalToConstant: 20)
      
      self.HistoryScrollView.addSubview(label)
      height += 25
      
      contentRect = contentRect.union(label.frame)
    }
    HistoryScrollView.contentSize = contentRect.size
  }
  
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
