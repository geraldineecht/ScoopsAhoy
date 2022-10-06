//
//  gradient.swift
//  appCaritasMty
//
//  Created by Geraldine Torres on 01/10/22.
//

import Foundation
import UIKit

extension UIView{
    public func setTwoGradient(colorOne: UIColor, colorTwo: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint (x: 1.0, y: 1.0)
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint (x: 0.5, y: 0.8)
        
        layer.insertSublayer (gradientLayer, at: 0)
    }
}
