//
//  Width  465px Height  113px Top  4118px Left  -1957px DashboardViewController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 21.03.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var GroopLabel: UILabel!
    
    let networkManager = NetworkManager.shared
    
    var item: Group?
    var grupe = "ИЭоз-60-17"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let group = GroupManager.shared.group{
            GroopLabel.text = group
        }
        
        
        TableView.register(UINib(nibName: "DashbordCell", bundle: nil), forCellReuseIdentifier: "DashbordCell")
        
        self.TableView.dataSource = self
        
        networkManager.request(groupName: grupe) { (resp, erro) in
            if let resp = resp{
                self.item = resp
                self.TableView.reloadData()
            }
        }
        
    }
}


extension DashboardViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getClasses(item: item).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashbordCell") as! DashbordCell
        
        cell.ClassesCell(classes: getClasses(item: item)[indexPath.row] )
        
        return cell
    }
    
    
}







//MARK: - доп методы
extension DashboardViewController {
    
    func getClasses(item: Group?) -> [Classes]{
        var array: [Classes] = []
        if let item = item {
            let foo = item.weeks?.first?.days
            foo?.forEach({ day in
                day.classes?.forEach({ classes in
                    array.append(classes)
                })
            })
        }
        
        return array
    }
}
