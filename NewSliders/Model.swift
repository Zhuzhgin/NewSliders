//
//  Model.swift
//  NewSliders
//
//  Created by Artem Zhuzhgin on 25.12.2021.
//

import Foundation
import UIKit

struct ColorView {
    var redColorValue: Float
    var greenColorValue: Float
    var blueColorValue: Float
    
    var viewBackgroundColor : UIColor {
      UIColor.init(red: CGFloat(redColorValue), green: CGFloat(greenColorValue), blue: CGFloat(blueColorValue), alpha: 1)
    }
}


