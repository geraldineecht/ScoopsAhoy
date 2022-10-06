//
//  ProjectCollectionViewCell.swift
//  appCaritasMty
//
//  Created by Alumno on 04/10/22.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    static let identifier = "projectCell"
    
    @IBOutlet weak var lbProjectName: UILabel!
    @IBOutlet weak var lbProjectDesc: UILabel!
    @IBOutlet weak var imgProjectImg: UIImageView!
    
    @IBOutlet weak var btnDetailView: UIButton!
    
    func setupCell(name: String, desc: String, image: UIImage){
        imgProjectImg.image = image
        lbProjectDesc.text = desc
        lbProjectName.text = name
        imgProjectImg.layer.cornerRadius = 5
    }
    
}
