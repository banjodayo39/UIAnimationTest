//
//  TopicCollectionViewCell.swift
//  UIAnimationTest
//
//  Created by Dayo on 23/04/2021.
//

import UIKit

protocol TopicCollectionViewCellDelegate : class {
    func collectionView(collectionviewcell: TopicCollectionViewCell?, index: Int, didTappedInTableViewCell: QuestTableCell)
}

class TopicCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopicCollectionViewCell"
    
    var title : UILabel!
    var image = UIImage(named: "subj-icon")
    var icon : UIImageView!
    var progressView : UIView!
    var viewContainer =  UIView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        
        backgroundColor = .white
        cornerRadius(16)

        title = generateLabel(title: "Living and Non-living...", size: 15)
        icon = generateImage(src: "subj-icon")
        
        //viewContainer.backgroundColor = .white
//        viewContainer.cornerRadius(20)
//        addSubviews(viewContainer)
//
//        viewContainer.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, size: CGSize(width: 148, height: 160))

    
        addSubviews(title, icon)
        
        icon.contentMode = .top
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
        icon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 80).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        title.anchor(top: icon.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 12, left: 20, bottom: 0, right: 20))
        title.numberOfLines = 0
        title.font = UIFont(name: "Mulish", size: 25)
        title.heightAnchor.constraint(equalToConstant: 40).isActive = true
        


    }

    
}
