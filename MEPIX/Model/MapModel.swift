//
//  MapModel.swift
//  MEPIX
//
//  Created by Морозов Иван on 28.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import Foundation
import ObjectMapper
import MapKit

class MapModel: Mappable {

    var markers: [Markers]?

    required init?(map: Map) {}

    func mapping(map: Map) {
        markers <- map["markers"]
    }
}

class Markers: NSObject,  Mappable, MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        get {
            let coor = CLLocationCoordinate2D()
            if let latitude = location?.lat, let longitude = location?.lng{
                return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            }
            return coor
        }
    }
    

    var tag: String?
    var address: String?
    var type: String?
    var name: String?
    var icon: String?
    var location: Location?
    var uid: String?

    required init?(map: Map) {}

    override init() {}
    
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
