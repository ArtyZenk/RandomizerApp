//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Artyom Guzenko on 28.05.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewValue(for randomNumber: RandomNumber)
}

class MainViewController: UIViewController {
    
    // MARK: - Elements
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    private var randomNumber = RandomNumber(minimumNumber: 0, maximumNumber: 100)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        maximumValueLabel.text = String(randomNumber.minimumNumber)
        maximumValueLabel.text = String(randomNumber.maximumNumber)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.randomNumber = randomNumber
        settingsVC.delegate = self
    }

    // MARK: - Actions
    @IBAction func getResultButtonPressed() {
        resultLabel.text = String(randomNumber.getRandom)
    }
    
}

extension MainViewController: SettingViewControllerDelegate {
    func setNewValue(for randomNumber: RandomNumber) {
        minimumValueLabel.text = String(randomNumber.minimumNumber)
        maximumValueLabel.text = String(randomNumber.maximumNumber)
        self.randomNumber = randomNumber
    }
}
