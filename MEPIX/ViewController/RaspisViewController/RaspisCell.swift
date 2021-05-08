//
//  RaspisCell.swift
//  MEPIX
//
//  Created by Дима Анисенко on 06.05.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class RaspisCell: UITableViewCell {

 
    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var end: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var person: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var rawType: UILabel!
    @IBOutlet weak var number: UILabel!
    
    // функция для лейбов и передачи данных в ячейку
    func setClass(classes:Classes) {
        name.text = classes.name
        person.text = classes.person
        rawType.text = classes.rawType
        place.text = classes.place
        
        
        
        
    }
}
