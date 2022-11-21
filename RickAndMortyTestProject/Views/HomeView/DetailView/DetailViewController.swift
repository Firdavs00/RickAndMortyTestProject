//
//  DetailViewController.swift
//  RickAndMortyTestProject
//
//  Created by Firdavs Boltayev on 20/11/22.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    let participanManager = NetWorkManager()
    var id: Int = 1
    
    lazy var idTitle: UILabel = {
        let label = UILabel()
        label.text = "NO"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.numberOfLines = 0
        return label
    }()
    
    lazy var nameTitle: UILabel = {
        let label = UILabel()
        label.text = "NO"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.numberOfLines = 0
        return label
    }()
    
    lazy var statusTitle: UILabel = {
        let label = UILabel()
        label.text = "NO"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.numberOfLines = 0
        return label
    }()
    
    lazy var speciesTitle: UILabel = {
        let label = UILabel()
        label.text = "NO"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.numberOfLines = 0
        return label
    }()
    
    lazy var genderTitle: UILabel = {
        let label = UILabel()
        label.text = "NO"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.numberOfLines = 0
        return label
    }()
    
    lazy var createdTitle: UILabel = {
        let label = UILabel()
        label.text = "NO"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "API"
        
        self.participanManager.getParticipant(id: id) { item in
            
            DispatchQueue.main.async { [self] in
                self.idTitle.text = "  Id: \(item.id ?? 0)"
                self.nameTitle.text = "  Name: \(item.name ?? "")"
                self.statusTitle.text = "  Name: \(item.status ?? "")"
                self.speciesTitle.text = "  Name: \(item.species ?? "")"
                self.genderTitle.text = "  Name: \(item.gender ?? "")"
                self.createdTitle.text = "  Name: \(item.created ?? "")"
            }
        }
        initSetup()
        initConstraint()
    }
    
    func initSetup() {
        
        view.addSubview(idTitle)
        view.addSubview(nameTitle)
        view.addSubview(statusTitle)
        view.addSubview(speciesTitle)
        view.addSubview(genderTitle)
        view.addSubview(createdTitle)
    }
    
    func initConstraint() {
        
        idTitle.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.right.equalToSuperview()
            
        }
        
        nameTitle.snp.makeConstraints { make in
            make.top.equalTo(idTitle.snp.bottom).inset(-5)
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.right.equalToSuperview()
        }
        
        statusTitle.snp.makeConstraints { make in
            make.top.equalTo(nameTitle.snp.bottom).inset(-5)
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.right.equalToSuperview()
        }
        
        speciesTitle.snp.makeConstraints { make in
            make.top.equalTo(statusTitle.snp.bottom).inset(-5)
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.right.equalToSuperview()
        }
        
        genderTitle.snp.makeConstraints { make in
            make.top.equalTo(speciesTitle.snp.bottom).inset(-5)
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.right.equalToSuperview()
        }
        
        createdTitle.snp.makeConstraints { make in
            make.top.equalTo(genderTitle.snp.bottom).inset(-5)
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.right.equalToSuperview()
        }
    }
}

