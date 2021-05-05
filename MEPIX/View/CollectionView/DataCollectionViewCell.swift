//
//  DataCollectionViewCell.swift
//  MEPIX
//
//  Created by Дима Анисенко on 29.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var Data: UIView!

    @IBOutlet weak var Day: UILabel!
    
    
    var weeks: DaysTest!{
        didSet{
            self.update()
        }
    }
    
    
    func update(){
        let colors:[UIColor] = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)]
        let color = Int.random(in: 0..<colors.count)
        if let weeks = weeks{
            Data.layer.cornerRadius = 20
            Data.backgroundColor = colors[color]
            Day.text = weeks.name
        }
    }
}
