//
//  RaspisViewController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 24.12.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import UIKit

class RaspisViewController: UIViewController {

    @IBOutlet weak var Date: UICollectionView!
    
    @IBOutlet weak var Raspisanie: UICollectionView!
    
    
    var date:Weeks!
    var selectedDate:Weeks?{
        didSet{
            if let dateS = self.selectedDate{
                self.title = dateS.firstDayOfWeek
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
