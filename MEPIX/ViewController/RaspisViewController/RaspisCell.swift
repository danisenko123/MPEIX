//
//  RaspisCell.swift
//  MEPIX
//
//  Created by Дима Анисенко on 18.05.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class RaspisCell: UITableViewCell {

    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var end: UILabel!
    @IBOutlet weak var person: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var rawType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func ClassesCell(classes:Classes){
        self.name.text = classes.name
        self.person.text = classes.person
        self.place.text = classes.place
        self.rawType.text = classes.rawType
        self.number.text = "\(String(describing: classes.number))"
        self.start.text = "\(String(describing: classes.time))"
        self.end.text = "\(String(describing: classes.time))"
    }
    
}
