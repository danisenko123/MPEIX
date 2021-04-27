//
//  GroopViewController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 23.11.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import UIKit




class GroupViewController: UIViewController {
    
    var networkManager = NetworkManager.shared

    @IBOutlet weak var GroupTextField: UITextField!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var lable3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    

    @IBAction func ButtonViewRass(_ sender: Any) {
        
        
        // для такста работы менеджерацц
        if let groupName = GroupTextField.text{
            networkManager.request(groupName: groupName) { (resp, err) in
                if let resp = resp{
                self.label1.text = resp.name
                self.label2.text = resp.weeks?.first?.firstDayOfWeek
                self.lable3.text = resp.weeks?.first?.days?.first?.classes?.first?.name
                self.label4.text = resp.weeks?.first?.days?.first?.classes?.first?.person
                }
                if err != nil {
                    self.label1.text = "Такой группы нет"
                    self.label2.text = nil
                    self.lable3.text = nil
                    self.label4.text = nil
                }

            }
        }
        
    }
    
}
