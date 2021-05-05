//
//  MapBottomViewController.swift
//  MEPIX
//
//  Created by Морозов Иван on 28.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class MapBottomViewController: UIViewController {
    
    let networkManager = NetworkManager.shared
    
    var markers: [Markers] = []{
        didSet{
            tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var arrName = ["food","buildings","dorms","place","departments"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNames()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    

    func setNames(){
        for (index, button) in buttons.enumerated(){
            button.setImage(UIImage(named: arrName[index]), for: .normal)

        }
    }
    

}

extension MapBottomViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        markers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let marker = markers[indexPath.row]
        
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
