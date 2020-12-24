//
//  Rasspisanie.swift
//  MEPIX
//
//  Created by Дима Анисенко on 05.12.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import Foundation


struct Raspisanie: Decodable{
    var groupNumber: String
    var groupId: String
    var weeks: [Weeks]
}

struct Weeks: Decodable {
    var weekOfYear: Int
    var weekOfSemester: Int
    var days: [Day]
}

struct Day: Decodable{
    var dayOfWeek: Int
    var date: String
    var classes: [Class]
}

struct Class: Decodable {
    var namber: Int
    var name: String
    var type: String
    var place: String
    var groups: String
    var person: String
    var time: String
    var start: String
    var end: String
}
