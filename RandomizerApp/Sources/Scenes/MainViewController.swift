//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Artyom Guzenko on 28.05.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewValue(for minimumNumber: String, and maximumNumber: String)
}

class MainViewController: UIViewController {
    
    // MARK: - Elements
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.minimumValue = minimumValueLabel.text ?? "0"
        settingsVC.maximumValue = maximumValueLabel.text ?? "100"
    }

    // MARK: - Actions
    @IBAction func getResultButtonPressed() {
        let minimumValue = Int(minimumValueLabel.text ?? "0")
        let maximumValue = Int(maximumValueLabel.text ?? "100")
        
        resultLabel.text = String(Int.random(in: (minimumValue ?? 0)...(maximumValue ?? 100)))
    }
    
}

extension MainViewController: SettingViewControllerDelegate {
    func setNewValue(for minimumNumber: String, and maximumNumber: String) {
        minimumValueLabel.text = minimumNumber
        maximumValueLabel.text = maximumNumber
    }
}
