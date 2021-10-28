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
    
    @IBAction func ButtonViewRass(_ sender: Any) {
     let storybord = UIStoryboard(name: "Main", bundle: nil)
        if let vc2 = storybord.instantiateViewController(identifier: "TabBarController") as? TabBarController{
            GroupManager.shared.group = GroupTextField.text
            show(vc2, sender: nil)
        }
     
         
 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    

 
    
    
    
    // для такста работы менеджера
        //if let groupName = GroupTextField.text{
            //networkManager.request(groupName: groupName) { (resp, err) in
                //if let resp = resp{
                //self.label1.text = resp.name
                //self.label2.text = resp.weeks?.first?.firstDayOfWeek
                //self.lable3.text = resp.weeks?.first?.days?.first?.classes?.first?.name
                //self.label4.text = resp.weeks?.first?.days?.first?.classes?.first?.person
    
    
                //if err != nil {
                    //self.label1.text = "Такой группы нет"
                    //self.label2.text = nil
                    //self.lable3.text = nil
                    //self.label4.text = nil
    }

            
        
    

