//
//  Rasspisanie.swift
//  MEPIX
//
//  Created by Дима Анисенко on 05.12.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import Foundation
import ObjectMapper


class Group: Mappable {
    var name:String?
    var id: String?
    var groupId: String?
    var weeks:[Weeks]?
    var groupNumber: String?
    var type: String?
    
    required init?(map: Map) {}
      
      func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
       groupId <- map["groupId"]
        weeks <- map["weeks"]
        groupNumber <- map["groupNumber"]
        type <- map["type"]
      }
}

class Weeks: Mappable {
    var weekOfYear: Int?
    var weekOfSemester: Int?
    var firstDayOfWeek: String?
    var days:[Days]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        weekOfSemester <- map["weekOfSemester"]
        days <- map["days"]
        weekOfYear <- map["weekOfYear"]
        firstDayOfWeek <- map["firstDayOfWeek"]
    }
}




class Days: Mappable {
    var dayOfWeek: Int?
    var date: String?
    var classes:[Classes]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        dayOfWeek <- map ["dayOfWeek"]
        date <- map ["date"]
        classes <- map ["classes"]
      }

}

class Classes: Mappable {
    var groups: String?
    var number: Int?
    var name: String?
    var place: String?
    var rawType: String?
    var time: Time?
    var person: String?
    var type: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
            groups <- map["groups"]
            number <- map["number"]
            name <- map["name"]
            place <- map["place"]
            rawType <- map["rawType"]
            time <- map["time"]
            person <- map["person"]
            type <- map["type"]
        }
}

class Time: Mappable {
    var start: String?
    var end: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        start <- map["start"]
        end <- map["end"]
    }
}




