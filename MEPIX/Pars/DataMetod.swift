//
//  DataMetod.swift
//  MEPIX
//
//  Created by Дима Анисенко on 24.01.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//

import Foundation

class DataMetod{
    func lordData(callback: @escaping([Day])->()) {
        let urlString = "http://api.openweathermap.org/data/2.5/forecast?q=Moscow,ru&appid=f4e8241056c46e3ab2fa1983bf196af9&units=metric"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            
            guard let data = data else {return}
            guard error == nil else {return}
            do {
                let dataWeeks = try JSONDecoder().decode(Weeks.self, from: data)
                var days: [Day] = []
                dataWeeks.days.forEach {  date in
                    if let date = date {
                        days.append(date)
                    }
                }
                callback(days)
            } catch let error {
                print(error)
            }
        }.resume()
        
    }
    }

