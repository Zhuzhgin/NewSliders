//
//  ViewController.swift
//  NewSliders
//
//  Created by Artem Zhuzhgin on 25.12.2021.
//

import UIKit
import Foundation

protocol MainViewControllerDelegate {
    func setNewValue(for colorView: ColorView )
 }

class StartViewController: UIViewController {
    
  
    @IBOutlet var navBarOutlet: UINavigationBar!
    
    var colorView = ColorView(redColorValue: 1, greenColorValue: 1, blueColorValue: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorView.viewBackgroundColor
        navBarOutlet.backgroundColor = colorView.viewBackgroundColor
        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainVC = segue.destination as? MainViewController else {return}
        mainVC.colorView = colorView
        mainVC.delegate = self
        
    }

}
extension StartViewController: MainViewControllerDelegate {
    func setNewValue(for colorView: ColorView) {
        view.backgroundColor = colorView.viewBackgroundColor
        navBarOutlet.backgroundColor = colorView.viewBackgroundColor
        
       self.colorView = colorView
    }
    
}
