//
//  StandartMetod.swift
//  MEPIX
//
//  Created by Дима Анисенко on 24.01.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import Foundation

class WeeksMetod {
    func lordRaspisanie(callback: @escaping([Weeks])->()){
        let urlString = "https://api.kekmech.com/mpeix/schedule/getGroupSchedule"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            guard let data = data else {return}
            guard error == nil else{return}
            do {
                let rasspisanieGroup = try JSONDecoder().decode(Raspisanie.self, from: data)
                var weeks: [Weeks] = []
                rasspisanieGroup.weeks.forEach { days in
                    if let days = days {
                        weeks.append(days)
                    }
                }
                callback(weeks)
            } catch let error {
                print(error)
            }
        }.resume()
        
    }
}
