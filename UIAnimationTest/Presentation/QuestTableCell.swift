//
//  QuestTableCell.swift
//  UIAnimationTest
//
//  Created by Dayo on 23/04/2021.
//

import UIKit

class QuestTableCell: UITableViewCell {
    
    static let identifier = "QuestTableCell"
    weak var cellDelegate : TopicCollectionViewCellDelegate?
    
    var topicCollectionView : UICollectionView!
    let iv = UIImageView(image: UIImage(named: "subj-icon"))

    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        backgroundColor = .clear
//
//        addSubview(iv)
//        iv.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
//                  size: CGSize(width: 80, height: 80))
//
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setUpView(){
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        //flowLayout.itemSize = CGSize(width: 160, height: 180)
        topicCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        topicCollectionView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: TopicCollectionViewCell.identifier)
        
        self.topicCollectionView.delegate = self
        self.topicCollectionView.dataSource = self
        topicCollectionView.backgroundColor = .clear

        //        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: 148, height: 160)
//        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 20)
//        flowLayout.scrollDirection = .horizontal
//        topicCollectionView.setCollectionViewLayout(flowLayout, animated: false)
        
        
        contentView.addSubview(topicCollectionView)
        topicCollectionView.isUserInteractionEnabled = true
        topicCollectionView.clipsToBounds = true
        topicCollectionView.isMultipleTouchEnabled = true
        topicCollectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        //topicCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    

}

extension QuestTableCell  : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let topicCell =  collectionView.dequeueReusableCell(withReuseIdentifier: TopicCollectionViewCell.identifier, for: indexPath) as? TopicCollectionViewCell
        return topicCell ?? UICollectionViewCell()
    }



    // Add spaces at the beginning and the end of the collection view
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets.init(top: 0, left: 1, bottom: 0, right: 16)
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 148, height: 162)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? TopicCollectionViewCell
        UIView.animate(withDuration: 0.1, animations: {
            cell?.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }, completion: {[weak self] _ in
            
            guard let cellView = cell else{
                cell?.transform = .identity
                return
            }
            self?.resetTransform(cellView: cellView)
            self?.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self!)

        })

    }
    
    func resetTransform(cellView: TopicCollectionViewCell){
        UIView.animate(withDuration: 0.1, animations: {
            cellView.transform = .identity
        }, completion: { _ in
            cellView.isHidden = true
        })
    }

}
