//
//  TypeMarkers.swift
//  MEPIX
//
//  Created by Морозов Иван on 11.05.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import Foundation

enum TypeMarkers: String, CaseIterable {
//    case buildind
//    case other
//    case structure
//    case food
//    case hostel
    
    case buildind =  "BUILDING"
    case other =     "OTHER"
    case structure = "STRUCTURE"
    case food =      "FOOD"
    case hostel =    "HOSTEL"
    
    init(_ type: String){
        switch type {
        case "BUILDING": self = .buildind
        case "OTHER" : self = .other
        case "STRUCTURE" : self = .structure
        case "FOOD" : self = .food
        case "HOSTEL" : self = .hostel
        default: self = .other
        }
    }
    
    static func getNameImage(index: Int) -> String {
        switch index {
        case 0: return self.buildind.rawValue
        case 1: return self.other.rawValue
        case 2: return self.structure.rawValue
        case 3: return self.food.rawValue
        case 4: return self.hostel.rawValue
        default: return ""
        }
    }
}

//case buildind =  "BUILDING"
//case other =     "OTHER"
//case structure = "STRUCTURE"
//case food =      "FOOD"
//case hostel =    "HOSTEL"
