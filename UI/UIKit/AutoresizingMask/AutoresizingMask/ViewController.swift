//
//  ViewController.swift
//  AutoresizingMask
//
//  Created by 김태성 on 2023/02/24.
//

import UIKit

class ViewController: UIViewController {

    lazy var startButton: UIButton = {
       let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var resetButton: UIButton = {
       let button = UIButton()
        button.setTitle("ReSet", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tappedReSetButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var rectangleView: UIView = {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 200, height: 200)))
        view.backgroundColor = .darkGray

        return view
    }()
    
    lazy var subRectangleView: UIView = {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 100, height: 100)))
        view.backgroundColor = .lightGray
        view.autoresizingMask = [.flexibleWidth]
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawView()
    }
    
    func drawView() {
        view.backgroundColor = .white
        
        view.addSubview(rectangleView)
        
        rectangleView.addSubview(subRectangleView)
        
        // 주석 지우면 설정 된 m제약에 의한 변화를 볼 수 있다.
        //subRectangleView.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfsubRectangleView = NSLayoutConstraint(item: subRectangleView, attribute: .centerX, relatedBy: .equal, toItem: rectangleView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerYOfsubRectangleView = NSLayoutConstraint(item: subRectangleView, attribute: .centerY, relatedBy: .equal, toItem: rectangleView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let widthOfsubRectangleView = NSLayoutConstraint(item: subRectangleView, attribute: .width, relatedBy: .equal, toItem: rectangleView, attribute: .width, multiplier: 0.5, constant: 0.0)
        let heightOfsubRectangleView = NSLayoutConstraint(item: subRectangleView, attribute: .height, relatedBy: .equal, toItem: rectangleView, attribute: .height, multiplier: 0.5, constant: 0.0)
        rectangleView.addConstraints([centerXOfsubRectangleView, centerYOfsubRectangleView, widthOfsubRectangleView, heightOfsubRectangleView])

        
        
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfStartButton = NSLayoutConstraint(item: startButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerYOfStartButton = NSLayoutConstraint(item: startButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.5, constant: 0.0)
        let widthOfStartButton = NSLayoutConstraint(item: startButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.3, constant: 0.0)
        let heightOfStartButton = NSLayoutConstraint(item: startButton, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.05, constant: 0.0)
        
        view.addConstraints([centerXOfStartButton, centerYOfStartButton, widthOfStartButton, heightOfStartButton])
        
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfReSetButton = NSLayoutConstraint(item: resetButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerYOfReSetButton = NSLayoutConstraint(item: resetButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.7, constant: 0.0)
        let widthOfReSetButton = NSLayoutConstraint(item: resetButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.3, constant: 0.0)
        let heightOfReSetButton = NSLayoutConstraint(item: resetButton, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.05, constant: 0.0)
        
        view.addConstraints([centerXOfReSetButton, centerYOfReSetButton, widthOfReSetButton, heightOfReSetButton])
        
    }
    
    @objc
    func tappedStartButton() {
        UIView.animate(withDuration: 3) {
            self.rectangleView.bounds.size = CGSize(width: 300, height: 300)
        }
        
    }
    
    @objc
    func tappedReSetButton() {
        UIView.animate(withDuration: 3) {
            self.rectangleView.bounds.size = CGSize(width: 200, height: 200)
        }
        
    }
}

