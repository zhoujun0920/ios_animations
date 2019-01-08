//
//  ViewController.swift
//  countingLabelAnimation
//
//  Created by Jun Zhou on 11/11/18.
//  Copyright © 2018 jzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let countingLabel: UILabel = {
        let label = UILabel()
        label.text = "1234"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    var startNumber: Double = 10
    let endNumber: Double = 1000
    let duration: Double = 2
    let now: Date = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countingLabel)
        countingLabel.frame = view.frame
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
    }
    
    @objc func handleUpdate() {
        let time = Date().timeIntervalSince(now)
        let percentage = time / duration
        if percentage < 1 {
            self.countingLabel.text = "\(startNumber + percentage * (endNumber - startNumber))"
        } else {
            self.countingLabel.text = "\(endNumber)"
        }
        
       
    }


}

