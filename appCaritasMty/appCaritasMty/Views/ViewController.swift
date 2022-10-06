//
//  ViewController.swift
//  appCaritasMty
//
//  Created on 06/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAdmin: UIButton!
    @IBOutlet weak var viewInfo: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        viewInfo.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        
        btnAdmin.layer.borderWidth = 1
        btnAdmin.layer.borderColor = UIColor(rgb: 0xFFAF80).cgColor
        btnAdmin.layer.cornerRadius = 10
    }
    
    

}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    


}


extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
