//
//  DachCell.swift
//  MEPIX
//
//  Created by Дима Анисенко on 14.11.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class DachCell: UICollectionViewCell {

    @IBOutlet weak var TableView: UITableView!
    var fullScreenHandler: ((_ cell:DachCell,_ indexProduct:Int)-> Void)?
    let networkManager = NetworkManager.shared
    
    var raspis: [Classes] = []
    var grupe = "С-06-20"

    override func awakeFromNib() {
        super.awakeFromNib()
        networkManager.request(groupName: grupe) {(resp, erro) in
                   if let resp = resp{
                       if let week = resp.weeks {
                           if let day = week.first?.days{
                               if let classes = day.first?.classes{
                                   self.raspis = classes
                                   self.TableView.reloadData()
                      }
                    }
                }
            }
        }
        self.TableView.dataSource = self
        self.TableView.delegate = self
        self.TableView.register(UINib(nibName: "DashbordCell", bundle: nil), forCellReuseIdentifier: "DashbordCell")
    }
    
    func setupCell(classes:[Classes]) {
        self.raspis = classes
        self.TableView.reloadData()
    }

}

extension DachCell: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        raspis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashbordCell") as! RaspisCell
        let classes: Classes = self.raspis[indexPath.row]
        cell.ClassesCell(classes: classes)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.TableView.deselectRow(at: indexPath, animated: true)
        fullScreenHandler?(self,indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension DachCell: UITableViewDelegate{
    
}

