//
//  Rasspisanie.swift
//  MEPIX
//
//  Created by Дима Анисенко on 05.12.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import Foundation

struct Group: Decodable {
    var name:String
    var id: String
    var weeks:[Weeks?]
}

struct Weeks: Decodable {
    var weekOfYear: Int
    var weekOfSemester: Int
    var firstDayOfWeek: String
    var days:[Days?]
}
struct Days: Decodable {
    var dayOfWeek: Int
    var date: String
    var classes:[Classes?]
}

struct Classes: Decodable {
    var name: String
    var rawType: String
    var place: String
    var groups: String
    var person: String
    var number: Int
    var start: String
    var end: String
}


