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
    
    let networkManager = NetworkManager.shared
    var mapBottomVC = MapBottomViewController()
    
    @IBOutlet weak var mapView: MKMapView!
    
    var markers: [Markers] = []
    var fpc: FloatingPanelController!

    override func viewDidLoad() {
        super.viewDidLoad()

        getMarkers()

        fpc = FloatingPanelController()
        fpc.delegate = self
        mapBottomVC = storyboard?.instantiateViewController(identifier: "MapBottomViewController") as! MapBottomViewController
        
        fpc.set(contentViewController: mapBottomVC)
        
        fpc.track(scrollView: mapBottomVC.tableView)
        fpc.addPanel(toParent: self)
        
//        fpc.isRemovalInteractionEnabled = true
//        present(fpc, animated: true, completion: nil)
//        mapView.addAnnotations(mapBottomVC.markers)
    }
    

    func getMarkers() {
        networkManager.request { [weak self] (resp, error) in
            guard let self = self else {return}
//            guard let error = error else {print("не получилось "); return}
            if let mapmodel = resp, let items = mapmodel.markers {
                self.markers = items
                self.mapBottomVC.markers = self.markers
                self.mapView.addAnnotations(self.markers)
            }
        }
    }

    
}

extension MapViewController: FloatingPanelControllerDelegate{
    
}
