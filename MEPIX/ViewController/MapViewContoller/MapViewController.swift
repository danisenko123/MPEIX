//
//  MapViewController.swift
//  MEPIX
//
//  Created by Морозов Иван on 28.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import UIKit
import FloatingPanel

class MapViewController: UIViewController {
    
    var fpc: FloatingPanelController!

    override func viewDidLoad() {
        super.viewDidLoad()

        fpc = FloatingPanelController()
        fpc.delegate = self
        let mapBottomVC = storyboard?.instantiateViewController(identifier: "MapBottomViewController") as! MapBottomViewController
        
        fpc.set(contentViewController: mapBottomVC)
        
        
        fpc.track(scrollView: mapBottomVC.tableView)
        fpc.addPanel(toParent: self)
        
//        fpc.isRemovalInteractionEnabled = true
//        present(fpc, animated: true, completion: nil)
    }
    

}

extension MapViewController: FloatingPanelControllerDelegate{
    
}
