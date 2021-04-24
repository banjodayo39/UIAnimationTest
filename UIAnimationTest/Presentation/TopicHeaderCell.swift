//
//  TopicHeaderCell.swift
//  UIAnimationTest
//
//  Created by Dayo on 23/04/2021.
//

import UIKit

class TopicHeaderCell : UIView{
    
    static let identifier = "TopicHeaderCell"

    var headerTitle : UILabel!
    var practiceButton  : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   func initView() {
        practiceButton = generateButton(title: "Practice",
                                        bgcolor: UIColor(named: "button-color") ?? .orange,
                                        txtColor: .white, size: 15, fontName: "Mulish")
        
        practiceButton.cornerRadius(5)
        headerTitle =  generateLabel(title: "1. Rational numbers", size: 24)
      
        addSubviews(headerTitle, practiceButton)
        practiceButton.anchor(top:  safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, size: CGSize(width: 80, height: 24))
        
  
        //headerTitle.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil)
    }
    
}
