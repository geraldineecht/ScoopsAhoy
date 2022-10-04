//
//  ProjectCollectionViewCell.swift
//  appCaritasMty
//
//  Created by Alumno on 04/10/22.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lbProjectName: UILabel!
    @IBOutlet weak var lbProjectDesc: UILabel!
    @IBOutlet weak var imgProjectImg: UIImageView!
    
    @IBOutlet weak var btnDetailView: UIButton!
    static let identifier = "projectCell"
    
    
    
}
