//
//  RAsspisanieViewCell.swift
//  MEPIX
//
//  Created by Дима Анисенко on 18.05.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class RasspisanieCell: UICollectionViewCell{
    
    @IBOutlet weak var tableView: UITableView!
    var fullScreenHandler: ((_ cell:RasspisanieCell,_ indexProduct:Int)-> Void)?
    let networkManager = NetworkManager.shared
    
    var raspis: [Classes] = []
    var grupe = "С-06-20"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        networkManager.request(groupName: grupe) { (resp, erro) in
               if let resp = resp{
                   if let week = resp.weeks {
                       if let day = week.first?.days{
                           if let classes = day.first?.classes{
                               self.raspis = classes
                               self.tableView.reloadData()
                           }
                       }
                   }
               }
           }
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "RaspisCell", bundle: nil), forCellReuseIdentifier: "RaspisCell")
    }
    //для скрола 
    func setupCell(classes:[Classes]) {
        self.raspis = classes
        self.tableView.reloadData()
    }

}

extension RasspisanieCell: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        raspis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RaspisCell") as! RaspisCell
        let classes: Classes = self.raspis[indexPath.row]
        cell.ClassesCell(classes: classes)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        fullScreenHandler?(self,indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension RasspisanieCell: UITableViewDelegate{
    
}
