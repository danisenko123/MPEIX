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

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    let networkManager = NetworkManager.shared
    
    var item: Group?
    var grupe = "ИЭС-165Б-17"
    
    
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

//MARK: - UICollectionView

extension RaspisViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
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
