//
//  SettingsViewController.swift
//  KVO-Project
//
//  Created by Maitree Bain on 4/7/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

   @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    private var fontSizeObservation: NSKeyValueObservation?
    
    private let iconNames = ["sun.haze.fill", "moon", "globe", "icloud"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePickerView()
        configureSize()
    }
    
    private func configurePickerView(){
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let newSize = Int(sender.value)
        Settings.shared.fontsize = newSize
        
    }
    
    private func configureSize() {
        fontSizeObservation = Settings.shared.observe(\.fontsize, options: [.old, .new], changeHandler: { (settings, change) in
            
            guard let newSize = change.newValue else { return }
            self.fontSizeLabel.text = newSize.description
            
        })
    }
    
}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return iconNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return iconNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let iconName = iconNames[row]
        Settings.shared.icon = iconName
    }
}
