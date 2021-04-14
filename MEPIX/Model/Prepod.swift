//
//  Prepod.swift
//  MEPIX
//
//  Created by Дима Анисенко on 14.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import Foundation

struct groupNumber: Decodable {
    var groupId:String
    var name: String
    var id: String
    var type: String
    var weeks:[WeeksPrepod?]
}

struct WeeksPrepod: Decodable {
    var weekOfYear: Int
    var weekOfSemester: Int
    var firstDayOfWeek: String
    var days: [DaysPrepod?]
}
struct DaysPrepod: Decodable {
    var dayOfWeek: Int
    var date: String
    var classes:[ClassesPrepod?]
}

struct ClassesPrepod: Decodable {
    var name: String
    var type: String
    var place: String
    var groups: String
    var person: String
    var number: Int
    var start: String
    var end: String
    var rawType: String
}
