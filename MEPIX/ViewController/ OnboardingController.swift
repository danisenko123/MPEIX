//
//  OnboardingController.swift
//  MEPIX
//
//  Created by Дима Анисенко on 09.11.2020.
//  Copyright © 2020 Дима Анисенко. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var panageControl: UIPageControl!
    @IBOutlet weak var GetStartButton: UIButton!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    var titles = ["Обновленный MPEIX","Просматривайте расписания","Создавайте заметки","Пользуйтесь картой","Ищите в приложении"]
    var descs = ["Мы полностью переосмыслили приложение, чтобы сделать его еще лучше", "К просмотренным ранее расписаниям вы имеете доступ даже без интернета", "Пользоваться заметками стало еще удобнее! Самые актуальные заметки теперь всегда отображаются на главном экране", "Теперь на карте отображены не только корпуса, столовые и общежития, но и другие важные места", "С главного экрана можно искать места на карте и свои заметки. Скоро добавим поиск групп и преподавателей!"]
    var imgs = ["MEPI","RAS","ZAM","MAP","SERCH"]
    
    override func viewDidLayoutSubviews() {
        scrollWidth = ScrollView.frame.size.width
        scrollHeight = ScrollView.frame.size.height
    }
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        self.ScrollView.delegate = self
        ScrollView.isPagingEnabled = true
        ScrollView.showsHorizontalScrollIndicator = false
        ScrollView.showsVerticalScrollIndicator = false
        
        var frame = CGRect (x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count{
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let slide = UIView(frame: frame)
            
            // SudView
            let imageView = UIImageView.init(image: UIImage.init(named: imgs[index]))
            
            imageView.frame = CGRect(x:0,y:0,width:300,height:300)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 50)
            
            let txt1 = UILabel.init(frame: CGRect(x:32,y:imageView.frame.maxY+30,width:scrollWidth-64,height:30))
                   txt1.textAlignment = .center
                   txt1.font = UIFont.boldSystemFont(ofSize: 20.0)
                   txt1.text = titles[index]

                   let txt2 = UILabel.init(frame: CGRect(x:32,y:txt1.frame.maxY+10,width:scrollWidth-64,height:50))
                   txt2.textAlignment = .center
                   txt2.numberOfLines = 3
                   txt2.font = UIFont.systemFont(ofSize: 18.0)
                   txt2.text = descs[index]

                   slide.addSubview(imageView)
                   slide.addSubview(txt1)
                   slide.addSubview(txt2)
                   ScrollView.addSubview(slide)
            
      
        }
        
        ScrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)

        self.ScrollView.contentSize.height = 1.0
        
        panageControl.numberOfPages = titles.count
        
        panageControl.currentPage = 0
     
    }
    
    @IBAction func pageChanged(_ sender: Any) {
            ScrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((panageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
        }
          
    func setIndiactorForCurrentPage()  {
            let page = (ScrollView?.contentOffset.x)!/scrollWidth
        panageControl?.currentPage = Int(page)
        }
    
    
}
