//
//  DashbordCell.swift
//  MEPIX
//
//  Created by Дима Анисенко on 10.11.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class DashbordCell: UITableViewCell {

    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var end: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var person: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var rawType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func ClassesCell(classes:Classes) {
        person.text = classes.person
        place.text = classes.place
        rawType.text = classes.rawType
        if let number = classes.number{
            self.number.text = String(number)
        }
        if var start = classes.time?.start{
            //если что это не серьездо
            start.removeLast()
            start.removeLast()
            start.removeLast()
            self.start.text = String(start)
        }
        if var end = classes.time?.end{
            end.removeLast()
            end.removeLast()
            end.removeLast()
            self.end.text = String(end)
        }
        name.text = classes.name
    }
}
