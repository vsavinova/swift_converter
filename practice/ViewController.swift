//
//  ViewController.swift
//  practice
//
//  Created by Victoria Savinova on 19.03.18.
//  Copyright © 2018 Victoria Savinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var pickerData : [String] = ["км", "мили", "C", "F"];
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    @IBOutlet weak var tfFrom: UITextField!
    @IBOutlet weak var pvFrom: UIPickerView!
    @IBOutlet weak var pvTo: UIPickerView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var answer: UILabel!
    
    @IBAction func buttonClicked(_ sender: Any) {
        var from = self.tfFrom.text!

        var labelFrom = pickerData[pvFrom.selectedRow(inComponent: 0)]
        var labelTo = pickerData[pvTo.selectedRow(inComponent: 0)]
        
        var result = convert(labelFrom: labelFrom, labelto: labelTo, from: (from as NSString).doubleValue)
        answer.text = result
    }
    
    private func convert(labelFrom: String, labelto : String,
                         from : Double) ->String {
        var result = "Неконвертируемые типы"
        switch labelFrom {
        case "C":
            if (labelto == "F") {
                result = "\(celsToFarengeit(from: from))"
            }
        case "F":
            if (labelto == "C") {
                result = "\(farengToCels(from: from))"
            }
        case "км":
            if (labelto == "мили") {
                result = "\(kmToMiles(from: from))"
            }
        case "мили":
            if (labelto == "км") {
                result = "\(milesToKm(from: from))"
            }
        default:
            result = "Неконвертируемые типы"
        }
        return result
    }
    
    private func celsToFarengeit( from : Double) -> Double {
        return from * 9/5 + 32
    }
    
    private func farengToCels( from : Double) -> Double{
        return from * 5/9 - 32
    }
    
    private func kmToMiles( from : Double) -> Double{
        return from * 1.609344
    }
    
    private func milesToKm( from : Double) -> Double{
        return from / 1.609344
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadPickerData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadPickerData() {
        self.pvFrom.delegate = self
        self.pvFrom.dataSource = self
        self.pvTo.delegate = self
        self.pvTo.dataSource = self
    }

}

