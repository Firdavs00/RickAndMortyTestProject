//
//  HomeViewController.swift
//  RickAndMortyTestProject
//
//  Created by Firdavs Boltayev on 19/11/22.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let participanManager = NetWorkManager()
   
    var results: [Results]? {
        didSet {
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
            print("Reults was set")
        }
    }
    
    private lazy var navigationBar: UIView = {
        let navBar = NavigationBar()
        navBar.backgroundColor = .white
        return navBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initSetup()
        initConstraint()
        
        participanManager.getMultParticipant(complation: { results in
        self.results = results.results
// Userdefaulst
        Defaults.storeParticipan(participan:MultParticipantsModel(results: self.results))
            
        DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        })
    }
    
    func initSetup() {
        
        view.addSubview(navigationBar)
        view.addSubview(tableView)
    }
    
    func initConstraint() {
        
        navigationBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(73/812 * windowHeight)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom).inset(-10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - Table view data source

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Defaults.loadParticipan()?.results?.count ?? 0 //results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.action = { click in
            
            let vc = DetailViewController()
            vc.id = self.results?[indexPath.row].id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let items = Defaults.loadParticipan()?.results?[indexPath.row]
        cell.characterImage.load(url: URL(string: items?.image ?? "")!)
        cell.characterName.setTitle(items?.name, for: .normal)
        cell.statusTitle.text = items?.status
        cell.speciesTitle.text = items?.species
        cell.originTitle.text = items?.origin?.name
        
        if items?.status == "Alive" {
            
            cell.circleActive.backgroundColor = .green
            
        } else if items?.status == "Dead"{
            
            cell.circleActive.backgroundColor = .red
            
        } else {
            cell.circleActive.backgroundColor = .systemGray
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == (Defaults.loadParticipan()?.results?.count ?? 0) - 1 {
            
            participanManager.page += 1
            participanManager.getMultParticipant(complation: { results in
                self.results! += results.results ?? []
            })
            Defaults.storeParticipan(participan:MultParticipantsModel(results: self.results))
        }
    }
}

