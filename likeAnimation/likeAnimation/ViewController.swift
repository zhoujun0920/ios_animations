//
//  ViewController.swift
//  likeAnimation
//
//  Created by Jun Zhou on 11/10/18.
//  Copyright © 2018 jzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let iconsContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white

        let iconHeight: CGFloat = 50
        
        let arrangedSubviews = [UIColor.red, .blue, .yellow, .orange, .black, .gray].map({ (color) -> UIView in
            var view = UIView()
            view.backgroundColor = color
            view.layer.cornerRadius = iconHeight / 2
            view.isUserInteractionEnabled = true
            view.tag = 3
            return view
        })
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .fillEqually
  
        let paddding: CGFloat = 8
        stackView.spacing = paddding
        stackView.layoutMargins = UIEdgeInsets(top: paddding, left: paddding, bottom: paddding, right: paddding)
        stackView.isLayoutMarginsRelativeArrangement = true

        let numIcons = CGFloat(arrangedSubviews.count)
        let width = numIcons * iconHeight + (numIcons + 1) * paddding
        let height = iconHeight + 2 * paddding
        
        containerView.addSubview(stackView)
        containerView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        containerView.layer.cornerRadius = containerView.frame.height / 2
        
        containerView.layer.shadowColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        containerView.layer.shadowRadius = 8
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        stackView.frame = containerView.frame
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        setupLongPressGesture()
        // Do any additional setup after loading the view, typically from a nib.
    }

    fileprivate func setupLongPressGesture() {
        self.view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress)))
    }
    
    fileprivate func handleGestureChanged(gesture: UILongPressGestureRecognizer) {
        let pressedLocation = gesture.location(in: self.iconsContainerView)
        let fixedYLocation = CGPoint(x: pressedLocation.x, y: self.iconsContainerView.frame.height / 2)
        if let hitTestView = iconsContainerView.hitTest(fixedYLocation, with: nil) {
            if hitTestView.tag == 3 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    let stackView = self.iconsContainerView.subviews.first
                    stackView?.subviews.forEach({ (view) in
                        view.transform = .identity
                    })
                    hitTestView.transform = hitTestView.transform.translatedBy(x: 0, y: -50)
                }, completion: nil)
            }
        }
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            view.addSubview(iconsContainerView)
            let pressedLocation = gesture.location(in: self.view)
            let centeredX = (self.view.frame.width - iconsContainerView.frame.width) / 2
            
            self.iconsContainerView.transform = CGAffineTransform(translationX: centeredX, y: pressedLocation.y)
            
            iconsContainerView.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.iconsContainerView.alpha = 1
                self.iconsContainerView.transform = CGAffineTransform(translationX: centeredX, y: pressedLocation.y - self.iconsContainerView.frame.height)
            }, completion: nil)
        } else if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                let stackView = self.iconsContainerView.subviews.first
                stackView?.subviews.forEach({ (view) in
                    view.transform = .identity
                })
                self.iconsContainerView.transform = self.iconsContainerView.transform.translatedBy(x: 0, y: 50)
                self.iconsContainerView.alpha = 0
            }) { (_) in
                self.iconsContainerView.removeFromSuperview()
            }
        } else if gesture.state == .changed {
            handleGestureChanged(gesture: gesture)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

