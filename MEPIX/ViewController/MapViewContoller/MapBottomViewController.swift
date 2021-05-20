//
//  MapBottomViewController.swift
//  MEPIX
//
//  Created by Морозов Иван on 28.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class MapBottomViewController: UIViewController {
    
    let manager = MapManager.shared

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var buttons: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNames()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    

    func setNames(){
        for (index, button) in buttons.enumerated(){
            let type = self.manager.getNameImage(index: index)
            let action = UIAction { _ in
                print("PROHLO")
                self.manager.filterMarkers(type: type )
                self.tableView.reloadData()
            }
            button.setImage(UIImage(named: type), for: .normal)
            button.addAction(action, for: .touchUpInside)
            
        }
    }
        

    @IBAction func buttons(_ sender: UIButton) {
            
        }
//        tableView.reloadData()
    
    
    
}



extension MapBottomViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.filterMarkers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let marker = manager.filterMarkers[indexPath.row]
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = marker.name
        content.secondaryText = marker.address
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    
}

extension MapBottomViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let view = UILabel()
        view.text = "   Места общепита"
        view.font = UIFont.boldSystemFont(ofSize: 30)
        view.backgroundColor = .white
        
        return view
    }
    
}
