//
//  ViewController.swift
//  shimmerAnimation
//
//  Created by Jun Zhou on 11/11/18.
//  Copyright © 2018 jzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        let darkTextLabel = UILabel()
        darkTextLabel.text = "Shimmer"
        darkTextLabel.textColor = UIColor(white: 1, alpha: 0.1)
        darkTextLabel.font = UIFont.systemFont(ofSize: 80)
        darkTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        darkTextLabel.textAlignment = .center
        
        view.addSubview(darkTextLabel)
        
        let lightTextLabel = UILabel()
        lightTextLabel.text = "Shimmer"
        lightTextLabel.textColor = UIColor(white: 1, alpha: 1)
        lightTextLabel.font = UIFont.systemFont(ofSize: 80)
        lightTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        lightTextLabel.textAlignment = .center
        
        view.addSubview(lightTextLabel)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = darkTextLabel.frame
        gradientLayer.transform = CATransform3DMakeRotation(45, 0, 0, 1)
        lightTextLabel.layer.mask = gradientLayer
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.duration = 2
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "somekey")
    
    }

    
}

