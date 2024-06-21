//
//  ViewController.swift
//  BS23Test
//
//  Created by Abdullah All Abir on 21/6/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var landmarkTableList: UITableView!
    
    var landMarkList : [LandMark] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        landmarkTableList.dataSource = self
        do{
            
            landMarkList = try ReadJsonFile.shared.readUserFromBundle() ?? []
        }
        catch{
            debugPrint(error.localizedDescription)
        }
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "landmark", for: indexPath) as! LandmarkTableViewCell
        cell.landmarkIcon.image = UIImage(named: landMarkList[indexPath.row].imageName)
        cell.landmarkIcon.layer.cornerRadius = 10
        cell.title.text = landMarkList[indexPath.row].name
        cell.subtitle.text = landMarkList[indexPath.row].subtitle
        
        return cell
    }
    
    
}
