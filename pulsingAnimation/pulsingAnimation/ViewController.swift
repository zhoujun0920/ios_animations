//
//  ViewController.swift
//  pulsingAnimation
//
//  Created by Jun Zhou on 11/11/18.
//  Copyright © 2018 jzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        trackLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.red.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.position = view.center
        trackLayer.lineCap = .round
        trackLayer.strokeEnd = 0.8
        view.layer.addSublayer(trackLayer)
        
        let pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = circularPath.cgPath
        pulsatingLayer.strokeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5).cgColor
        pulsatingLayer.lineWidth = 10
        pulsatingLayer.fillColor = UIColor.clear.cgColor
        pulsatingLayer.position = view.center
        pulsatingLayer.lineCap = .round
        view.layer.addSublayer(pulsatingLayer)
        
        let scaleUpAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleUpAnimation.fromValue = 1
        scaleUpAnimation.toValue = 1.1
        
        let scaleDownAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleDownAnimation.fromValue = 1.1
        scaleDownAnimation.toValue = 1
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [scaleUpAnimation, scaleDownAnimation]
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity
        animationGroup.autoreverses = true
        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        pulsatingLayer.add(animationGroup, forKey: "bounds")
    }


}

