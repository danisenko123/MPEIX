//
//  RaspisViewController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 24.12.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import UIKit

class RaspisViewController: UIViewController {
    @IBOutlet weak var date: UICollectionView!
    @IBOutlet weak var raspisanie: UICollectionView!
    let networkManager = NetworkManager.shared
    
    var raspis: [Classes] = []
   
    
    var grupe = "ИЭС-165Б-17"
    
    var selectedGroup: Days?{
        didSet{
            if let days = self.selectedGroup{
                self.title = days.date
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            networkManager.request(groupName: grupe) { (resp, erro) in
                if let resp = resp{
                    if let week = resp.weeks {
                        if let day = week.first?.days{
                            if let classes = day.first?.classes{
                                self.raspis = classes
                            }
                        }
                    }
                }
            }
        
        self.raspisanie.register(UINib(nibName: "RasspisanieCell",bundle: nil ), forCellWithReuseIdentifier: "RasspisanieCell")
        self.raspisanie.dataSource = self
        self.raspisanie.delegate = self
        
        self.date.register(UINib(nibName: "DateCell", bundle: nil), forCellWithReuseIdentifier: "DateCell")
        self.date.dataSource = self
        self.date.delegate = self
        
     
        
}
    

    
    
    
}
extension RaspisViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        raspis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RasspisanieCell", for: indexPath) as! RasspisanieCell
        let _: Classes = self.raspis[indexPath.row]
            cell.setupCell(classes:raspis)
          
            return cell
    }
    
    
}
