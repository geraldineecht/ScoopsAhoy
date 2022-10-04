//
//  DescripcionViewController.swift
//  appCaritasMty
//
//  Created by Geraldine Torres on 30/09/22.
//

import UIKit

class DescripcionViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var vistaDatos: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = vistaDatos.frame.size
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
