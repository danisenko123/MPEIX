//
//  DateCollectionViewCell.swift
//  MEPIX
//
//  Created by Дима Анисенко on 18.05.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

class DateCell: UICollectionViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var wike: UILabel!
    @IBOutlet weak var mach: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.contentView.backgroundColor = .white
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func DateCell(date:Days, weeks:Weeks, isSelected: Bool){
        self.date.text = date.date
        self.wike.text = weeks.firstDayOfWeek
        if isSelected{
            self.contentView.backgroundColor = .blue
        } else {
            self.contentView.backgroundColor = .white
        }
    }

}
