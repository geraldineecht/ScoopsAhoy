//
//  ProyectosViewController.swift
//  appCaritasMty
//
//  Created by Alumno on 01/10/22.
//

import UIKit

class ProyectosViewController: UIViewController {

    @IBOutlet weak var projectCollectionView: UICollectionView!
    
    var itemList = [projectList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item:projectList=projectList(projectName: "Banco de Alimentos", projectDesc: "blah blah blah blah blah blah etc etc etc texto texto texto lorem ipsum etc etc aaa aaa aaa bbb bbb bbb bbb", projectImage: UIImage(named: "imgAlimentos")!)
        itemList.append(item)
        
        // aqui van los projects
        
        // CardView.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = projectCollectionView.dequeueReusableCell(withReuseIdentifier: "projectCell", for: IndexPath) as! ProjectCollectionViewCell
        
        cell.imgProjectImg.image = itemList[indexPath.row].projectImage
        cell.lbProjectName = itemList[indexPath.row].projectName
        cell.imgProjectImg.layer.cornerRadius = 5
        return cell
        
    }
}
