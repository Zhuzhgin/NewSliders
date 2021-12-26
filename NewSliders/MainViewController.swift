//
//  MainViewController.swift
//  NewSliders
//
//  Created by Artem Zhuzhgin on 25.12.2021.
//

import UIKit



class MainViewController: UIViewController {

    @IBOutlet var colorOfMainView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    
    @IBOutlet var greenValueLabel: UILabel!
    
    @IBOutlet var blueValueLabel: UILabel!
    
    
    @IBOutlet var redValueTF: UITextField!
    
    @IBOutlet var greenValueTF: UITextField!
    
    @IBOutlet var blueValueTF: UITextField!
    
    
    @IBOutlet var redSlider: UISlider!
    
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var blueeSlider: UISlider!
    
    var colorView: ColorView!
    var delegate : MainViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       showColorView()

    }

// MARK: = IBActions
    @IBAction func redSliderMoved(_ sender: UISlider) {
        slidersNewColorsSet()
    }
    
    @IBAction func greenSliderMoved(_ sender: UISlider) {
        slidersNewColorsSet()
    }
    
    @IBAction func blueSliderMoved(_ sender: UISlider) {
        slidersNewColorsSet()
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setNewValue(for: colorView)
        dismiss(animated: true)
    }
    
    
    func showColorView() {
        
        colorOfMainView.backgroundColor = colorView.viewBackgroundColor
        
        redValueLabel.text = String(colorView.redColorValue)
        greenValueLabel.text = String(colorView.greenColorValue)
        blueValueLabel.text = String(colorView.blueColorValue)
        
        redValueTF.text = String(colorView.redColorValue)
        greenValueTF.text = String(colorView.greenColorValue)
        blueValueTF.text = String(colorView.blueColorValue)
        
        redSlider.setValue(colorView.redColorValue, animated: true)
        greenSlider.setValue(colorView.greenColorValue, animated: true)
        blueeSlider.setValue(colorView.blueColorValue, animated: true)
        
    }
    
    private func slidersNewColorsSet() {
        colorView.redColorValue = roundValue(for: redSlider.value)
        colorView.greenColorValue = roundValue(for: greenSlider.value)
        colorView.blueColorValue = roundValue(for: blueeSlider.value)
        
        showColorView()
    }
    
    private func roundValue(for unroundValue: Float) -> Float {
        round(unroundValue * 100)/100
    }

}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else {
            showAlert()
            return }
        guard let numberValue = Float(newValue) else {
            showAlert()
             return }
        guard numberValue >= 0 && numberValue <= 1  else {
            showAlert()
            return
        }
        
        switch textField {
        case redValueTF:
            colorView.redColorValue = roundValue(for: numberValue)
            showColorView()
        case greenValueTF :
            colorView.greenColorValue = roundValue(for: numberValue)
            showColorView()
        default:
            colorView.blueColorValue = roundValue(for: numberValue)
            showColorView()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case redValueTF : greenValueTF.becomeFirstResponder()
        case greenValueTF: blueValueTF.becomeFirstResponder()
        default:
            view.endEditing(true)
        }
        return true
    }
}

    extension MainViewController {
        func showAlert() {
            let alertController = UIAlertController(title: "Не верные данные!", message: "Введите значение от 0 до 1", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default) {   _ in
                self.redValueTF.text = String(self.colorView.redColorValue)
                self.greenValueTF.text = String(self.colorView.greenColorValue)
                self.blueValueTF.text = String(self.colorView.blueColorValue)
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }


      
        
    
 
    
    
    

