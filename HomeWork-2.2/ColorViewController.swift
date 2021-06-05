//
//  ViewController.swift
//  HomeWork-2.2
//
//  Created by Татьяна Татьяна on 20.05.2021.
//

import UIKit

class ColorViewController: UIViewController {
    
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
    
    var mainColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    
    override func viewDidLoad() {
        viewPrint.backgroundColor = mainColor
    }
// creat func change color and alpha
    private func changColor() {
        mainColor = UIColor(displayP3Red: CGFloat(rSlider.value), green: CGFloat(gSlaider.value), blue: CGFloat(bSlaider.value), alpha: CGFloat(aSlaider.value))
        viewPrint.backgroundColor = mainColor
    }
 
    
// creat action sliders wich use func change color and sed valeus in label
    @IBAction func redSender(_ sender: UISlider) {
        changColor()
        redLabel.text = String((sender.value * 100).rounded() / 100)
    }
    @IBAction func greenSender(_ sender: UISlider) {
        changColor()
        greenLabel.text = String((sender.value * 100).rounded() / 100)

    }
    @IBAction func blueSender(_ sender: UISlider) {
        changColor()
        blueLabel.text = String((sender.value * 100).rounded() / 100)
    }
    @IBAction func alfaSender(_ sender: UISlider) {
        changColor()
        alfaLabel.text = String((sender.value * 100).rounded() / 100)
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        delegate.setNewValues(for: mainColor)
    }
    

}

