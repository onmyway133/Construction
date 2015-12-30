//
//  ViewController.swift
//  Configurable
//
//  Created by Khoa Pham on 12/30/2015.
//  Copyright (c) 2015 Khoa Pham. All rights reserved.
//

import UIKit
import Configurable

class ViewController: UIViewController {
    let label = UILabel().configure {
        $0.text = "Fantageek"
        $0.textColor = UIColor.redColor()
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
        label.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        label.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

