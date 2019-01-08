//
//  ViewController.swift
//  liveStreamAnimation
//
//  Created by Jun Zhou on 11/11/18.
//  Copyright © 2018 jzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap() {
        (0...10).forEach { (_) in
            generateView()
        }
    }
    
    func generateView() {
        let v = UIView()
        v.backgroundColor = drand48() > 0.5 ? .red : .blue
        let dimension = 20 + drand48() * 10
        v.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        v.layer.cornerRadius = v.frame.width / 2
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        v.layer.add(animation, forKey: nil)
        view.addSubview(v)
    }
    
    func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        let endPoint = CGPoint(x: 400, y: 200)
        let randomY = drand48() * 300
        let cp1 = CGPoint(x: 100, y: 100 - randomY)
        let cp2 = CGPoint(x: 200, y: 300 - randomY)
        path.move(to: CGPoint(x: 0, y: 200))
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }


}

