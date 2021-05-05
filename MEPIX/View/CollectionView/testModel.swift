//
//  testModel.swift
//  MEPIX
//
//  Created by Дима Анисенко on 29.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit

struct DaysTest {
    let name:String
    
    // Load data(Normally from database or so)
    static func load() -> [DaysTest] {
        var categories:[DaysTest] = []
        let names:[String] = ["ПН", "ВТ", "СР", "ЧТ", "ПТ","СБ","ВС"]
        for name in names{
            categories.append(DaysTest(name:name))
        }
        categories.shuffle()
        return categories
    }
}
