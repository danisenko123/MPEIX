//
//  MapBottomViewController.swift
//  MEPIX
//
//  Created by Морозов Иван on 27.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class MapBottomViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var arrName = ["food","buildings","dorms","place","departments"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNames()
        tableView.dataSource = self
    }
    

    func setNames(){
        for (index, button) in buttons.enumerated(){
            button.setImage(UIImage(named: arrName[index]), for: .normal)
//            button.
        }
    }

}

extension MapBottomViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
