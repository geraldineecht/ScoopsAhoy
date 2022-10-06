//
//  ProyectosViewController.swift
//  appCaritasMty
//
//  Created by Alumno on 01/10/22.
//

import UIKit


class ProyectosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var projectCollectionView: UICollectionView!
    
    var itemList = [projectList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // aqui van los projects
        itemList.append(projectList(projectName: "Banco de Alimentos", projectDesc: "blah blah blah blah blah blah etc etc etc texto texto texto lorem ipsum etc etc aaa aaa aaa bbb bbb bbb bbb", projectImage: UIImage(named: "imgAlimentos")!))
        itemList.append(projectList(projectName: "Ropita", projectDesc: "blah blah blah blah blah blah etc etc etc texto texto texto lorem ipsum etc etc aaa aaa aaa bbb bbb bbb bbb", projectImage: UIImage(named: "imgAlimentos")!))
        itemList.append(projectList(projectName: "Moto mami", projectDesc: "blah blah blah blah blah blah etc etc etc texto texto texto lorem ipsum etc etc aaa aaa aaa bbb bbb bbb bbb", projectImage: UIImage(named: "imgAlimentos")!))
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return itemList.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = projectCollectionView.dequeueReusableCell(withReuseIdentifier: "projectCell", for: indexPath) as! ProjectCollectionViewCell
          let project = itemList[indexPath.row]
          cell.setupCell(name: project.projectName, desc: project.projectDesc, image: project.projectImage)
          return cell
      }
    

      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let selectedData = itemList[indexPath.row]
          print(itemList[indexPath.row].projectName)
          performSegue(withIdentifier: "showDetail", sender: selectedData)
      }

   /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let selectedItem = sender as? projectList else {
            return
        }
        if segue.identifier == "showDetail" {
            guard let destinationVC = segue.destination as? DetalleProyectoViewController else {
                return
            }
            destinationVC.projectReceived = selectedItem
        }
    }*/
}
