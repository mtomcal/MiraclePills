//
//  ViewController.swift
//  MiraclePills
//
//  Created by Michael A Tomcal on 9/24/16.
//  Copyright © 2016 Two Eye Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var successImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pillLabel: UILabel!
    @IBOutlet weak var pillImage: UIImageView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var zipField: UITextField!
    @IBOutlet weak var borderView: UIView!
    
    let states = ["Alaska", "Arkansas", "California", "New York"]
    var formElements: Array<UIView> = [];
    
    @IBAction func onBuyNow(_ sender: UIButton) {
        enableForm(false)
        successImage.isHidden = false
    }
    
    @IBAction func onButton(_ sender: UIButton) {
        enablePicker(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        
        self.formElements = [
            priceLabel,
            pillImage,
            pillLabel,
            borderView,
            titleLabel,
            stateButton,
            countryField,
            countryLabel,
            fullNameLabel,
            fullNameField,
            streetLabel,
            streetField,
            cityLabel,
            cityField,
            stateLabel,
            buyNowButton,
            zipLabel,
            zipField
        ]
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enablePicker(_ isEnabled: Bool) {
        picker.isHidden = !isEnabled
        countryLabel.isHidden = isEnabled
        countryField.isHidden = isEnabled
        zipLabel.isHidden = isEnabled
        zipField.isHidden = isEnabled
        buyNowButton.isHidden = isEnabled
    }
    
    func enableForm(_ isEnabled: Bool) {
        self.formElements.forEach({ (elem) in
            elem.isHidden = !isEnabled
        })
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateButton.setTitle(states[row], for: UIControlState.normal)
        enablePicker(false)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    


}

