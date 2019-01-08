//
//  ViewController.swift
//  zoomBounceEffect
//
//  Created by Jun Zhou on 11/11/18.
//  Copyright © 2018 jzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cell: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cell = UIView()
        cell.frame = CGRect(x: view.frame.width / 2 - 10, y: view.frame.height / 2 - 10, width: 20, height: 20)
        cell.backgroundColor = .red
        self.view.addSubview(cell)
        
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }

    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: self.view)
        if let v = self.view.hitTest(location, with: nil) {
            if v == self.cell {
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    self.cell.layer.transform = CATransform3DMakeScale(3, 3, 3)
                }) { (_) in
                    
                }
            } else {
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    self.cell.layer.transform = CATransform3DIdentity
                }) { (_) in
                    
                }
            }
        }
    }

}

