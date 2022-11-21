//
//  HomeTableViewCell.swift
//  RickAndMortyTestProject
//
//  Created by Firdavs Boltayev on 19/11/22.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {
    
    var action: ((Bool) -> Void)?

    lazy var characterImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")//274
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()
    
    lazy var characterName: UIButton = {
        let label = UIButton()
        label.setTitle("Kristen Stewart", for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.titleLabel?.font = UIFont.systemFont(ofSize: 18,weight: .bold)
        label.addTarget(self, action: #selector(tapped(_ :)), for: .touchUpInside)
        return label
    }()
    
     lazy var circleActive: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var statusTitle: UILabel = {
        let label = UILabel()
        label.text = "Alive"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor.systemGray2
        return label
    }()
    
    private lazy var littleLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray3
        return view
    }()
    
    lazy var speciesTitle: UILabel = {
        let label = UILabel()
        label.text = "Human"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor.systemGray2
        return label
    }()
    
    lazy var originTitle: UILabel = {
        let label = UILabel()
        label.text = "Earth (C-500A)"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor.systemGray
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        initSetup()
        initConstraint()
    }
    
    func initSetup() {
        
        contentView.addSubview(characterImage)
        contentView.addSubview(characterName)
        contentView.addSubview(circleActive)
        contentView.addSubview(statusTitle)
        contentView.addSubview(littleLine)
        contentView.addSubview(speciesTitle)
        contentView.addSubview(originTitle)

    }
    
    func initConstraint() {
        
        characterImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
            make.height.equalTo(80/812 * windowHeight)
            make.width.equalTo(80/375 * windowWidth)
        }
        
        characterName.snp.makeConstraints { make in
            make.top.equalTo(6)
            make.left.equalTo(characterImage.snp.right).inset(-15)
        }
        
        circleActive.snp.makeConstraints { make in
            make.top.equalTo(characterName.snp.bottom).inset(-7)
            make.left.equalTo(characterImage.snp.right).inset(-15)
            make.height.equalTo(10/812 * windowHeight)
            make.width.equalTo(10/375 * windowWidth)
        }
        
        statusTitle.snp.makeConstraints { make in
            make.top.equalTo(characterName.snp.bottom).inset(-3)
            make.left.equalTo(circleActive.snp.right).inset(-10)
        }
        
        littleLine.snp.makeConstraints { make in
            make.top.equalTo(characterName.snp.bottom).inset(-13)
            make.left.equalTo(statusTitle.snp.right).inset(-5)
            make.height.equalTo(1)
            make.width.equalTo(5)
        }
        
        speciesTitle.snp.makeConstraints { make in
            make.top.equalTo(characterName.snp.bottom).inset(-3)
            make.left.equalTo(littleLine.snp.right).inset(-5)
        }
        
        originTitle.snp.makeConstraints { make in
            make.top.equalTo(circleActive.snp.bottom).inset(-7)
            make.left.equalTo(characterImage.snp.right).inset(-15)
        }
    }
    
    @objc func tapped(_ sender: UIButton) {
        
        if let action = self.action {
            action(true)
        }
        print("BTN")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
