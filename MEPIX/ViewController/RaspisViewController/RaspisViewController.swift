//
//  RaspisViewController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 24.12.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import UIKit

class RaspisViewController: UIViewController {
    
    //MARK: - IBOutlet

    
    @IBOutlet weak var dayPicer: DayPicerView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var days = ["Пн","Вт","Ср","Чт","Пт","Сб","Вс"]
    
    let networkManager = NetworkManager.shared
    
    var item: Group?
    var grupe = "ИЭоз-60-17"
    
    
    //MARK: - LiveCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "RaspisCell", bundle: nil), forCellReuseIdentifier: "RaspisCell")
        
        self.tableView.dataSource = self
        
        networkManager.request(groupName: grupe) { (resp, erro) in
            if let resp = resp{
                self.item = resp
                self.tableView.reloadData()
            }
        }
        
        dayPicer.dataSourse = self
    }
    
}


//MARK: - UITableView
extension RaspisViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getClasses(item: item).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RaspisCell") as! RaspisCell
        
        cell.ClassesCell(classes: getClasses(item: item)[indexPath.row] )
        
        return cell
    }
    
    
}



//реализация Патерна Мост
extension RaspisViewController: DayPicerViewDataSourse {
    func DayPicerCount(_ dayPicer: DayPicerView) -> Int {
        return days.count
    }
    
    func DayPicerTitle(_ dayPicer: DayPicerView, IndexPath: IndexPath) -> String {
        return days [IndexPath.row]
    }
    
    
}



//MARK: - доп методы
extension RaspisViewController {
    
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
