//
//  MainView.swift
//  SetupConstraintsByCode
//
//  Created by nguyen.duc.huyb on 6/3/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UIKit

final class MainView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.axis = .horizontal
        sv.spacing = 16
        return sv
    }()
    
    private let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let view2: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let view3: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let view4: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let view5: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let view6: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

extension MainView {
    fileprivate func setupView() {
        self.addSubview(view1)
        self.addSubview(view2)
        self.addSubview(view3)
        self.addSubview(view4)
        self.addSubview(view5)
        self.addSubview(view6)
    }
    
    fileprivate func setupConstraints() {
        //Using NSLayoutConstraints 1
        let horizontalConstraint = NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 64)
        let verticalConstraint = NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 32)
        let widthConstraint = NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        self.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        //Using NSLayout Constraint 2
        NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -64).isActive = true
        NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 32).isActive = true
        NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
        
        //Using Visual Format Language 1
        let views = ["view1": view1, "newView": view3]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-64-[newView(100)]-(>=64)-|", metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[view1]-64-[newView(100)]",  metrics: nil, views: views)
        self.addConstraints(horizontalConstraints)
        self.addConstraints(verticalConstraints)
        
        //Using Visual Format Language 2
        let views2 = ["view2": view2, "newView": view4]
        let horizontalConstraints2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(>=64)-[newView(100)]-64-|", metrics: nil, views: views2)
        let verticalConstraints2 = NSLayoutConstraint.constraints(withVisualFormat: "V:[view2]-64-[newView(100)]", metrics: nil, views: views2)
        NSLayoutConstraint.activate(horizontalConstraints2)
        NSLayoutConstraint.activate(verticalConstraints2)
        
        //Using NSLayoutAnchor 1
        let horizontalConstraint2 = view5.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 64)
        let verticalConstraint2 = view5.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64)
        let widthConstraint2 = view5.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint2 = view5.heightAnchor.constraint(equalToConstant: 100)
        self.addConstraints([horizontalConstraint2, verticalConstraint2, widthConstraint2, heightConstraint2])
        
        //Using NSLayoutAnchor 2
        let horizontalConstraint3 = view6.topAnchor.constraint(equalTo: view4.bottomAnchor, constant: 64)
        let verticalConstraint3 = view6.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64)
        let widthConstraint3 = view6.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint3 = view6.heightAnchor.constraint(equalToConstant: 100)
        NSLayoutConstraint.activate([horizontalConstraint3, verticalConstraint3, widthConstraint3, heightConstraint3])
    }
}
