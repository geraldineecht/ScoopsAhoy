//
//  DatosProyectosViewController.swift
//  appCaritasMty
//
//  Created by Geraldine Torres on 01/10/22.
//

import UIKit

class DatosProyectosViewController: UIViewController {

    @IBOutlet weak var vistaAlimentos: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vistaAlimentos.setTwoGradient(colorOne: UIColor.white.withAlphaComponent(0.1), colorTwo: UIColor(red: 0.56, green: 0.76, blue: 0.62, alpha: 1.00))
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
