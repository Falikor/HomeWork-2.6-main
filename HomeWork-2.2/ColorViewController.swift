//
//  ViewController.swift
//  HomeWork-2.2
//
//  Created by Татьяна Татьяна on 20.05.2021.
//

import UIKit

protocol UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, sender: UISlider)
}

class ColorViewController: UIViewController, UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, sender: UISlider) {
        textField.text = String(format: "%.2f", sender.value)
        switch textField {
        case refTextField:
            redLabel.text = String(format: "%.2f", sender.value)
        case greenTextField:
            greenLabel.text = String(format: "%.2f", sender.value)
        case blueTextField:
            blueLabel.text = String(format: "%.2f", sender.value)
        case alphaTextFild:
            alfaLabel.text = String(format: "%.2f", sender.value)
        default:
            print("Error")
        }
    }
    
    
// added utlet View, Labels, Sliders
    
    @IBOutlet weak var viewPrint: UIView!
    @IBOutlet weak var redLabel: UILabel! 
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alfaLabel: UILabel!
    
    
// Added start value and color
    
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlaider: UISlider!
    @IBOutlet weak var bSlaider: UISlider!
    @IBOutlet weak var aSlaider: UISlider!
    
// All TextFild
    @IBOutlet weak var refTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var alphaTextFild: UITextField!
    
    
    var mainColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    
    override func viewDidLoad() {
        viewPrint.backgroundColor = mainColor
        getColorValue(UIColor: mainColor)
        
    }
    private func getColorValue(UIColor: UIColor) {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        UIColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        rSlider.value = Float(red)
        gSlaider.value = Float(green)
        bSlaider.value = Float(blue)
        aSlaider.value = Float(alpha)
        
        redLabel.text = String(format: "%.2f", rSlider.value)
        greenLabel.text = String(format: "%.2f", gSlaider.value)
        blueLabel.text = String(format: "%.2f", bSlaider.value)
        alfaLabel.text = String(format: "%.2f", aSlaider.value)
        
        refTextField.text = String(format: "%.2f", rSlider.value)
        greenTextField.text = String(format: "%.2f", gSlaider.value)
        blueTextField.text = String(format: "%.2f", bSlaider.value)
        alphaTextFild.text = String(format: "%.2f", aSlaider.value)
        
    }
// creat func change color and alpha
    private func changColor() {
        mainColor = UIColor(displayP3Red: CGFloat(rSlider.value), green: CGFloat(gSlaider.value), blue: CGFloat(bSlaider.value), alpha: CGFloat(aSlaider.value))
        viewPrint.backgroundColor = mainColor
    }
 
// creat action sliders wich use func change color and sed valeus in label
    @IBAction func redSender(_ sender: UISlider) {
        changColor()
        textFieldDidEndEditing(refTextField, sender: sender)
    }
    @IBAction func greenSender(_ sender: UISlider) {
        changColor()
        textFieldDidEndEditing(greenTextField, sender: sender)

    }
    @IBAction func blueSender(_ sender: UISlider) {
        changColor()
        textFieldDidEndEditing(blueTextField, sender: sender)
    }
    @IBAction func alfaSender(_ sender: UISlider) {
        changColor()
        textFieldDidEndEditing(alphaTextFild, sender: sender)
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        delegate.setNewValues(for: mainColor)
    }
    

}

