//
//  TableViewCell+Extension.swift
//  MEPIX
//
//  Created by Морозов Иван on 14.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func create(table: UITableViewCell) -> UITableViewCell{
        let className = String(describing:self)

        return UITableViewCell()
    }
}
