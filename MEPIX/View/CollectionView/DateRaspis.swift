//
//  DateRaspis.swift
//  MEPIX
//
//  Created by Дима Анисенко on 13.03.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class DateRaspis: UICollectionViewCell {
    
    @IBOutlet weak var Week: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Mac: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.contentView.backgroundColor = .white
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(days:Weeks,isSelected:Bool){
        self.Week.text = days.firstDayOfWeek
        if isSelected{
          self.contentView.backgroundColor = .orange
        }else{
           self.contentView.backgroundColor = .white
        }
    }
    
    

}
