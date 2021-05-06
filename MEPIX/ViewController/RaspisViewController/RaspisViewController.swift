//
//  RaspisViewController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 24.12.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import UIKit

class RaspisViewController: UIViewController {
    let networkManager = NetworkManager.shared
    
    @IBOutlet weak var raspistab: UITableView!
    
    var raspis: [Classes] = [] 
    
    var grupe = "ИЭС-165Б-17"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.request(groupName: grupe) { (resp, erro) in
            if let resp = resp{
                if let week = resp.weeks {
                    if let day = week.first?.days{
                        if let classes = day.first?.classes{
                            self.raspis = classes
                            self.raspistab.reloadData()
                        }
                    }
                }
            }
        }
        
        raspistab.dataSource = self
        raspistab.delegate = self
       
       
        }
    }
    
extension RaspisViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        raspis.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Raspis", for: indexPath)
        let classec: Classes = self.raspis[indexPath.row]
        
        cell.textLabel?.text = classec.name
        cell.textLabel?.text = classec.person
        cell.textLabel?.text = classec.rawType
        cell.textLabel?.text = classec.place
        return cell
        
       
    }
    
    
}
    
extension RaspisViewController: UITableViewDelegate{
    
}

    
    
    


