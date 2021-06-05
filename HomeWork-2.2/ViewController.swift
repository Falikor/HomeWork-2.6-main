//
//  ViewController.swift
//  HomeWork-2.2
//
//  Created by Татьяна Татьяна on 20.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
// added utlet View, Labels, Sliders
    
    @IBOutlet weak var viewPrint: UIView!
    @IBOutlet weak var redLabel: UILabel! 
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alfaLabel: UILabel!
    
// Added start value and color
    
    @IBOutlet weak var rSlider: UISlider! {
        didSet {
            rSlider.tintColor = UIColor.red
            rSlider.value = 0
        }
    }
    
    @IBOutlet weak var gSlaider: UISlider! {
        didSet {
            gSlaider.tintColor = UIColor.green
            gSlaider.value = 0
        }
    }

    @IBOutlet weak var bSlaider: UISlider! {
        didSet {
            bSlaider.tintColor = UIColor.blue
            bSlaider.value = 0
        }
    }
    
    @IBOutlet weak var aSlaider: UISlider! {
        didSet {
            aSlaider.tintColor = UIColor.black
            aSlaider.value = 1
        }
    }
    
// creat func change color and alpha
    private func changColor() {
        viewPrint.backgroundColor = UIColor(displayP3Red: CGFloat(rSlider.value), green: CGFloat(gSlaider.value), blue: CGFloat(bSlaider.value), alpha: CGFloat(aSlaider.value))
    }
    private func alterVC() {

        if rSlider.value == 1 && gSlaider.value == 1 && bSlaider.value == 1 && aSlaider.value == 1 {
        let alertVCMax = UIAlertController(title: "Maximum values", message: "All values maximum, you see white view", preferredStyle: .alert)
        alertVCMax.addAction(UIAlertAction(title: "Thanks", style: .default))
        present(alertVCMax, animated: true)
        } else if rSlider.value == 0 && gSlaider.value == 0 && bSlaider.value == 0 && aSlaider.value == 0 {
            let alertVCMin = UIAlertController(title: "Minimum values", message: "All values minimum, you see nothing", preferredStyle: .alert)
            alertVCMin .addAction(UIAlertAction(title: "Thanks", style: .default))
            present(alertVCMin , animated: true)
        }
    }
    
// creat action sliders wich use func change color and sed valeus in label
    @IBAction func redSender(_ sender: UISlider) {
        changColor()
        redLabel.text = String((sender.value * 100).rounded() / 100)
        // cheng color buten slaider
        if sender.value == rSlider.maximumValue {
            rSlider.thumbTintColor = UIColor.red
        } else {
            rSlider.thumbTintColor = UIColor.white
        }
        alterVC()
    }
    @IBAction func greenSender(_ sender: UISlider) {
        changColor()
        greenLabel.text = String((sender.value * 100).rounded() / 100)
        // cheng color buten slaider
        if sender.value == gSlaider.maximumValue {
            gSlaider.thumbTintColor = UIColor.green
        } else {
            gSlaider.thumbTintColor = UIColor.white
        }
        alterVC()
    }
    @IBAction func blueSender(_ sender: UISlider) {
        changColor()
        blueLabel.text = String((sender.value * 100).rounded() / 100)
        // cheng color buten slaider
        if sender.value == bSlaider.maximumValue {
            bSlaider.thumbTintColor = UIColor.blue
        } else {
            bSlaider.thumbTintColor = UIColor.white
        }
        alterVC()
    }
    @IBAction func alfaSender(_ sender: UISlider) {
        changColor()
        alfaLabel.text = String((sender.value * 100).rounded() / 100)
        alterVC()
    }
}

