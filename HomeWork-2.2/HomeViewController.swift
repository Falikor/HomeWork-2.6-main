//
//  HomeViewController.swift
//  HomeWork-2.2
//
//  Created by Татьяна Татьяна on 05.06.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for mainColor: UIColor)
}

class HomeViewController: UIViewController {

    private var mainColor = UIColor(red: 0,
                                    green: 0,
                                    blue: 0,
                                    alpha: 1)
    
    override func viewDidLoad() {
        refreshViewBGColor()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ColorViewController else { return }
        vc.mainColor = mainColor
        vc.delegate = self
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        //delite all text and deactivate button
//        guard let svc = segue.source as? ColorViewController else {return}

    }

}

extension HomeViewController {
private func refreshViewBGColor() {
    view.backgroundColor = mainColor
}
}

extension HomeViewController: SettingsViewControllerDelegate {
func setNewValues(for mainColor: UIColor) {
    self.mainColor = mainColor
    refreshViewBGColor()
}
}
