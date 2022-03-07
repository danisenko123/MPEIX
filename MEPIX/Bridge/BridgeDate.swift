//
//  Bridge.swift
//  MEPIX
//
//  Created by Дима Анисенко on 30.10.2021.
//  Copyright © 2021 Дима Анисенко. All rights reserved.
//



import UIKit

protocol DayPicerViewDataSourse {
    func DayPicerCount (_ dayPicer: DayPicerView) -> Int
    func DayPicerTitle (_ dayPicer: DayPicerView, IndexPath: IndexPath) -> String
    
}

class DayPicerView: UIControl {
    public var dataSourse: DayPicerViewDataSourse? {
        didSet {
            setuoView()
        }
    }
    
    private var buttons:[UIButton] = []
    private var stackView: UIStackView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    func setuoView() {
        let count = dataSourse?.DayPicerCount(self)
        
        for item in 0..<count! {
            let indexPath = IndexPath(row: item, section: 0)
            let title = dataSourse?.DayPicerTitle(self, IndexPath: indexPath)
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.tag = item
            button.setTitleColor(UIColor.lightGray, for: .normal)
            button.setTitleColor(UIColor.white, for: .selected)
            button.addTarget(self, action: #selector(selectedButton), for: .touchUpInside)
            buttons.append(button)
            self.addSubview(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        self.addSubview(stackView)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        
    }
    
    @objc func selectedButton(sender:  UIButton) {
        for b in buttons {
                  b.isSelected = false
              }
        let index  = sender.tag
        let button = self.buttons[index]
        button.isSelected = true
        
    }
}
