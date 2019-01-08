//
//  ViewController.swift
//  blurEffect
//
//  Created by Jun Zhou on 11/12/18.
//  Copyright © 2018 jzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
    let effectView = UIVisualEffectView(effect: nil)
    let blurEffect = UIBlurEffect(style: .regular)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "demo")
        imageView.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 100, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        effectView.frame = view.frame
        self.view.addSubview(effectView)
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(slider)
        slider.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        slider.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        slider.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
       
        slider.addTarget(self, action: #selector(handleSlider), for: .valueChanged)
        animator.addAnimations {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.effectView.effect = self.blurEffect
            }, completion: { (_) in
                
            })
        }
    }

    @objc func handleSlider(slider: UISlider) {
        animator.fractionComplete = CGFloat(slider.value)
    }

}

