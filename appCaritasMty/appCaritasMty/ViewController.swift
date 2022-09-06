//
//  ViewController.swift
//  appCaritasMty
//
//  Created on 06/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewInfo: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        viewInfo.roundCorners(corners: [.topLeft, .topRight], radius: 30)
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
