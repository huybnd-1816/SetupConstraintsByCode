//
//  ViewController.swift
//  SetupConstraintsByCode
//
//  Created by nguyen.duc.huyb on 6/3/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    private var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }

    private func config() {
        mainView = MainView(frame: CGRect.zero)
        view.addSubview(mainView)
        mainView?.translatesAutoresizingMaskIntoConstraints = false
        mainView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

