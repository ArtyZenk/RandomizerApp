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
    
    var randomNumber: RandomNumber!
    
    var delegate: SettingViewControllerDelegate!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setStartValue()
        setupView()
    }
    
    // MARK: - IBActions
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        delegate.setNewValue(for: randomNumber)
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension SettingsViewController {
    private func setupView() {
        minimumTF.delegate = self
        maximumTF.delegate = self
    }
    
    private func setStartValue() {
        minimumTF.text = String(randomNumber.minimumNumber)
        maximumTF.text = String(randomNumber.maximumNumber)
    }
}

// MARK: - UITextDelegate
extension SettingsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return }
        
        if textField == minimumTF {
            randomNumber.minimumNumber = numberValue
        } else {
            randomNumber.maximumNumber = numberValue
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == minimumTF {
            maximumTF.becomeFirstResponder()
        }
        return true
    }
}
