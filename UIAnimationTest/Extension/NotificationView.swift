//
//  NotificationView.swift
//  UIAnimationTest
//
//  Created by Dayo on 23/04/2021.
//


import UIKit
import SwiftUI

class NotificationView: UIView {
    
    // MARK: - Properties
    var shape = CAShapeLayer()
    var container: UIView!
    var label: UILabel!
    var vector: UIImageView!
    var icon: UIView!
    let shapeContainer = UIView()

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        setupView()
        icon.isHidden = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        container = generateView()
        container.backgroundColor = .white
        label = generateLabel(title: "Loading message here...", size: 15)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .gray
        
        vector = generateImage(src: "spinner-vector")
        icon = generateImage(src: "success")
    
        
        addSubview(container)
        container.centerXAnchor.constraint(equalTo: centerXAnchor).isActive =  true
        container.centerYAnchor.constraint(equalTo: centerYAnchor).isActive =  true
        container.widthAnchor.constraint(equalToConstant: 300).isActive = true
        container.heightAnchor.constraint(equalToConstant: 300).isActive = true
        container.layer.cornerRadius = 20
        
        let centerPoint = CGPoint(x: container.center.x + 150, y: container.center.x + 150)
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: 30, startAngle: 0, endAngle: .pi * 1.8, clockwise: true)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 4
        shape.strokeColor = UIColor.orange.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 190
        shape.lineCap = .round
        shapeContainer.layer.addSublayer(shape)
        container.addSubview(shapeContainer)
        //container.layer.addSublayer(shape)
        container.addSubviews(vector, label, icon)
        shapeContainer.centerInSuperview()
        shapeContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        shapeContainer.widthAnchor.constraint(equalToConstant: 150).isActive = true
        shapeContainer.layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi/180), 0, 0, -1)
        
        
        label.anchor(top: nil, leading: container.leadingAnchor, bottom: container.bottomAnchor, trailing: container.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 40, right: 20))
        icon.centerInSuperview()
        
    }
    
   
    
  func faceBugRight() {
      
      UIView.animate(withDuration: 1.0,
                     delay: 0.0,
                     options: [.curveEaseInOut , .allowUserInteraction],
                     animations: {
                      self.shapeContainer.transform = CGAffineTransform(rotationAngle: .pi)
                      self.shapeContainer.center = self.center
      },
                     completion: { finished in
                      print("Bug faced right!")
      })
    }
    
    
    
    func animate() {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = 3
        circularProgressAnimation.repeatCount = .greatestFiniteMagnitude
        circularProgressAnimation.fromValue = -Double.pi * 2
        circularProgressAnimation.toValue = Double.pi * 2
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        shape.add(circularProgressAnimation, forKey: "progressAnim")
    }
    
    func success(msg: String) {
        icon.isHidden = false
        label.text = msg
    }
   
}


