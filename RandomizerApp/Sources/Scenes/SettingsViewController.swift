//
//  SettingsViewController.swift
//  RandomizerApp
//
//  Created by Artyom Guzenko on 28.05.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Elements
    @IBOutlet weak var minimumTF: UITextField!
    @IBOutlet weak var maximumTF: UITextField!
    
    var minimumValue = String()
    var maximumValue = String()
    
    var delegate: SettingViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        delegate.setNewValue(for: minimumTF.text ?? "0", and: maximumTF.text ?? "100")
    }
    
}

// MARK: - Private Methods
extension SettingsViewController {
    private func setupView() {
        minimumTF.text = minimumValue
        maximumTF.text = maximumValue
        
        minimumTF.delegate = self
        maximumTF.delegate = self
    }
}

// MARK: - UITextDelegate
extension SettingsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == minimumTF {
            maximumTF.becomeFirstResponder()
        }
        return true
    }
}
