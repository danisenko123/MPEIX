//
//  Width  465px Height  113px Top  4118px Left  -1957px DashboardViewController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 21.03.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    
    
    @IBOutlet weak var GroopLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let group = GroupManager.shared.group{
            GroopLabel.text = group
        }
        
        
    }
    



}
