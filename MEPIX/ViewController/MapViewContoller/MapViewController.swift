//
//  MapViewController.swift
//  MEPIX
//
//  Created by Морозов Иван on 28.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit
import FloatingPanel
import MapKit

class MapViewController: UIViewController {
    
    //MARK:- Constraints
    let manager = MapManager.shared
    var mapBottomVC = MapBottomViewController()
    
    
    //MARK:- Outlet
    @IBOutlet weak var mapView: MKMapView!
    
    
    //MARK:- Properties
    var fpc: FloatingPanelController!
    
    // Для оцентровки института при открытии карты
    let initialLocation = CLLocation(latitude: 55.755462, longitude: 37.708806)


    
    //MARK:- LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        fpc = FloatingPanelController()
        fpc.delegate = self
        mapBottomVC = storyboard?.instantiateViewController(identifier: "MapBottomViewController") as! MapBottomViewController
        
        fpc.set(contentViewController: mapBottomVC)
        
        fpc.track(scrollView: mapBottomVC.tableView)
        fpc.addPanel(toParent: self)
        
//        fpc.isRemovalInteractionEnabled = true
//        present(fpc, animated: true, completion: nil)
//        mapView.addAnnotations(mapBottomVC.markers)
        mapView.centerToLocation(initialLocation)
        
        manager.getMarkers {
            self.mapView.addAnnotations(self.manager.markers)
            self.mapBottomVC.tableView.reloadData()
        }

    }
    

    
}

extension MapViewController: FloatingPanelControllerDelegate{
    
}


private extension MKMapView {
  func centerToLocation( _ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
