//
//  MapViewController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 04.03.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    @IBOutlet weak var MapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MapView.camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: 55.757318, longitude: 37.714482), zoom: 15)
        let marcer = GMSMarker()
        marcer.position = CLLocationCoordinate2D(latitude: 55.757318, longitude: 37.714482)
        marcer.title = "Пятерочка"
        marcer.snippet = "Энергетическая ул., 11"
        marcer.map = MapView
        
    
        let newmarcer = GMSMarker()
        newmarcer.position = CLLocationCoordinate2D(latitude: 55.756789, longitude: 37.70462)
        newmarcer.title = "Столовая корпуса М"
        newmarcer.snippet = "Корпус М, 7 этаж"
        newmarcer.map = MapView
        
        let marcerb = GMSMarker()
        marcerb.position = CLLocationCoordinate2D(latitude: 55.75521, longitude: 37.712206)
        marcerb.title = "Столовые МТУСИ"
        marcerb.snippet = "Здание МТУСИ, 1 и 2 этаж"
        marcerb.map = MapView
        
        let mepi = GMSMarker()
        mepi.position = CLLocationCoordinate2D(latitude: 55.756444, longitude: 37.711608)
        mepi.title = "Столовая №10"
        mepi.snippet = "Лапина ул., 17"
        mepi.map = MapView
        
        let mn = GMSMarker()
        mn.position = CLLocationCoordinate2D(latitude: 55.757042, longitude: 37.71525)
        mn.title = "Дикси"
        mn.snippet = "Энергетическая ул., 13"
        mn.map = MapView
        
        let bl = GMSMarker()
        bl.position = CLLocationCoordinate2D(latitude: 55.754725, longitude: 37.70907)
        bl.title = "Блинная"
        bl.snippet = "Корпус Г, 3 этаж"
        bl.map = MapView
        
        let G = GMSMarker()
        G.position = CLLocationCoordinate2D(latitude: 55.754758, longitude: 37.709009)
        G.title = "Корпус Г"
        G.snippet = "Красноказарменная ул., 17"
        G.map = MapView
        
        let burger = GMSMarker()
        burger.position = CLLocationCoordinate2D(latitude: 55.753266, longitude: 37.715739)
        burger.title = "Бургер Кинг"
        burger.snippet = "Авиамоторная ул., 12"
        burger.map = MapView
        
        
    }
    

   


}
