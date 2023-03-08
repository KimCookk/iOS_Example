//
//  ViewController.swift
//  CodeBaseTabBarController
//
//  Created by 김태성 on 2023/03/04.
//

import UIKit

class TabViewController: UIViewController {

    convenience init(title: String, backgroundColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

