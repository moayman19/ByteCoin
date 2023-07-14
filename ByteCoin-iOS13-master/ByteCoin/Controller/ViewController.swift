//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    var coinManager = CoinManager()
    
    
    @IBOutlet weak var coinPickerView: UIPickerView!
    @IBOutlet weak var coinPrice: UILabel!
    @IBOutlet weak var coinSelected: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        coinPickerView.delegate = self
        coinPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

   func numberOfComponents(in pickerView: UIPickerView) -> Int {
       1
   }
   
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       coinManager.currencyArray.count
   }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       let coinName = coinManager.currencyArray[row]
        coinSelected.text = coinName
        coinManager.fetchCoin(coinName: coinName)
        
    }
    
    
    
    
    
}

