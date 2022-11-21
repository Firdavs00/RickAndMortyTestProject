//
//  NavigationBar.swift
//  RickAndMortyTestProject
//
//  Created by Firdavs Boltayev on 19/11/22.
//

import Foundation
import UIKit
import SnapKit

class NavigationBar: UIView {
    
    private lazy var navBarTitle: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var navLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initSetup()
        initContstraint()
    }
    
    func initSetup() {
        
        self.addSubview(navBarTitle)
        self.addSubview(navLine)
    }
    
    func initContstraint() {
       
        navBarTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(50/812 * windowHeight)
        }
        
        navLine.snp.makeConstraints { make in
            make.top.equalTo(navBarTitle.snp.bottom).inset(-5)
            make.left.right.equalTo(0)
            make.height.equalTo(1)
        }
    }
}
