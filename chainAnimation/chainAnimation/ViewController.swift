//
//  ViewController.swift
//  chainAnimation
//
//  Created by Jun Zhou on 11/10/18.
//  Copyright © 2018 jzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel:UILabel = UILabel()
    var bodyLabel:UILabel = UILabel()
    
    fileprivate func setUpLabels() {
        titleLabel.backgroundColor = .white
        bodyLabel.backgroundColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.text = "Leave Us A Message"
        titleLabel.font = UIFont(name: "Futura", size: 34)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "Hello there! Hello there! Hello there! Hello there! Hello there! Hello there! Hello there! Hello there! Hello there! Hello there! Hello there! "
    }
    
    fileprivate func setUpStackView() {
        let stackView = UIStackView(arrangedSubviews:[titleLabel, bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        setUpLabels()
        setUpStackView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation)))
    }
    
    @objc fileprivate func handleTapAnimation(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: self.titleLabel.transform.tx, y: -200)
                
            }, completion: { (_) in
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                }) { (_) in
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                        self.bodyLabel.transform = CGAffineTransform(translationX: self.titleLabel.transform.tx, y: -200)
                        self.bodyLabel.alpha = 0
                    }, completion: nil)
                }
            })
        }
    }


}

