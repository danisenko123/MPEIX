//
//  MapModel.swift
//  MEPIX
//
//  Created by Морозов Иван on 28.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import Foundation
import ObjectMapper

class MapModel: Mappable {

    var markers: [Markers]?

    required init?(map: Map) {}

    func mapping(map: Map) {
        markers <- map["markers"]
    }
}

class Markers: Mappable {

    var tag: String?
    var address: String?
    var type: String?
    var name: String?
    var icon: String?
    var location: Location?
    var uid: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        tag <- map["tag"]
        address <- map["address"]
        type <- map["type"]
        name <- map["name"]
        icon <- map["icon"]
        location <- map["location"]
        uid <- map["uid"]
    }
}

class Location: Mappable {

    var lng: Double?
    var lat: Double?

    required init?(map: Map) {}

    func mapping(map: Map) {
        lng <- map["lng"]
        lat <- map["lat"]
    }
}
