//
//  RaspisViewController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 24.12.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import UIKit

class RaspisViewController: UIViewController {

    
    @IBOutlet weak var GoupTabview: UITableView!
    
    var arrey: [Weeks] = []
    var erorrDownload: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
