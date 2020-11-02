//
//  BarsViewController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 15.03.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import UIKit

class BarsViewController: UIViewController {

    @IBAction func VKbutton(_ sender: Any) {
        if let url = URL(string: "http://vk.com/kekmech") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    


}
