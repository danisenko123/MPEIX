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
    
    @IBOutlet weak var raspisView: UITableView!
    
    @IBOutlet weak var rawType: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var person: UILabel!
    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var end: UILabel!
    
    
    var raspis: [Classes] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        raspisView.dataSource = self
        raspisView.separatorStyle = .none
    }
    
    
}
extension RaspisViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        raspis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
