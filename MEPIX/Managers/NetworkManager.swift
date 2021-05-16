//
//  NetworkManager.swift
//  MEPIX
//
//  Created by Морозов Иван on 22.04.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static var shared = NetworkManager()
    
    func request(groupName: String, completion: @escaping (_ data: Group?, _ error: Error?) -> Void)  {
        let url =  "https://api.kekmech.com/mpeix/schedule/v1/group/\(groupName)/schedule/1"
        if let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
        AF.request(urlString)
            .validate(statusCode: 200..<300)
            .responseJSON { (respons) in
                switch respons.result {
                case .success(let data):
                    if let group = Group(JSON: data as! [String : Any]){
                        //print(group.name)
                        completion(group, nil)
                    }
                case .failure(let error):
                    //print(error)
                    completion(nil, error)
                }
            }
        }
            
        
    }
    
    
    func request(completion: @escaping (_ data: MapModel?, _ error: Error?) -> Void)  {
        let url =  "https://api.kekmech.com/mpeix/map/getMapMarkers"
        if let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
        AF.request(urlString)
            .validate(statusCode: 200..<300)
            .responseJSON { (respons) in
                switch respons.result {
                case .success(let data):
                    if let item = MapModel(JSON: data as! [String : Any]){
                        //print(item.markers?.first?.name)
                        completion(item, nil)
                    }
                case .failure(let error):
                    //print(error)
                    completion(nil, error)
                }
            }
        }
        
            
    }
    
    
}
