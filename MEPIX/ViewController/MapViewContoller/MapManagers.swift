//
//  MapManagers.swift
//  MEPIX
//
//  Created by Морозов Иван on 05.05.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import Foundation

class MapManager {
        
    static let shared = MapManager()
    
    let networkManager = NetworkManager.shared

    
    var markers: [Markers] = []

    
    //MARK:- Network
    func getMarkers(complition: ( () -> Void )? = nil ) {
        networkManager.request { [weak self] (resp, error) in
            guard let self = self else {return}
//            guard let error = error else {print("не получилось "); return}
            if let mapmodel = resp, let items = mapmodel.markers {
                self.markers = items
                complition?()
            }
        }
    }

    
    
    
    
    
}
