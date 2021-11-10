//
//  GroupManager.swift
//  MEPIX
//
//  Created by Дима Анисенко on 28.09.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import Foundation


class GroupManager{
   var  networkManager = NetworkManager.shared
    
     
    
    static let shared = GroupManager()
    var group: String?
}
