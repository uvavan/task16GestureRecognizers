//
//  ViewController.swift
//  task16GestureRecognizers
//
//  Created by Admin on 04.12.2017.
//  Copyright © 2017 Bioprom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var ibViewBackGround: UIView!
    @IBOutlet private weak var ibImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecognizer()
    }
    
    private func setupRecognizer() {
        let tapRecognizedView = UITapGestureRecognizer(target: self, action: #selector (tapRecognizede(_ :)))
        let rotationRecognizedView = UIRotationGestureRecognizer(target: self, action: #selector(rotationRecognized(_:)))
        let pinchRecognizedView = UIPinchGestureRecognizer(target: self, action: #selector(pinchRecognized(_:)))
        let panRecognizedView = UIPanGestureRecognizer(target: self, action: #selector(panRecognized(_:)))
        view.addGestureRecognizer(tapRecognizedView)
        view.addGestureRecognizer(rotationRecognizedView)
        ibViewBackGround.addGestureRecognizer(pinchRecognizedView)
        view.addGestureRecognizer(panRecognizedView)
    }
    
    @objc private func panRecognized(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        UIView.animate(withDuration: 0.2) {
            self.ibViewBackGround.center = point
        }
    }
    
    @objc private func pinchRecognized(_ sender: UIPinchGestureRecognizer) {
        guard let transformedView = sender.view else { return }
        transformedView.transform = transformedView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
    
    @objc private func rotationRecognized(_ sender: UIRotationGestureRecognizer) {
        UIView.animate(withDuration: 0.3) {
            self.ibViewBackGround.transform = CGAffineTransform.init(rotationAngle: sender.rotation)
        }
    }
    
    @objc private func tapRecognizede(_ sender: UITapGestureRecognizer) {
        ibViewBackGround.backgroundColor = randomColor()
    }
    
    private func randomColor() -> UIColor {
        var rendom: [CGFloat] = []
        for _ in 0...2 {
            rendom.append(CGFloat(arc4random_uniform(256)))
        }
        return UIColor(red: rendom[0]/255, green: rendom[1]/255, blue: rendom[2]/255, alpha: 1)
    }
    
}

