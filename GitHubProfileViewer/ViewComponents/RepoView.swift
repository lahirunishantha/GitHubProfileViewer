//
//  RepoStatsView.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/7/21.
//

import UIKit

class RepoView: UIView {
    let profileWidthHeight:CGFloat = 32
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(container)
        container.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, center: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0,
            paddingRight: 0, width: 0, height: 0)
        
        container.addSubview(profileImageView)
        profileImageView.anchor(top: container.topAnchor, left: container.leftAnchor, bottom: nil, right: nil, center: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 0,
            paddingRight: 0, width: profileWidthHeight, height: profileWidthHeight)
        
        container.addSubview(uidLabel)
        uidLabel.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, center: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 0,
            paddingRight: 0, width: 250, height: 15)
        
        container.addSubview(projectLabel)
        projectLabel.anchor(top: profileImageView.bottomAnchor, left: container.leftAnchor, bottom: nil, right: nil, center: nil, paddingTop: 5, paddingLeft: 15, paddingBottom: 0,
            paddingRight: 0, width: 250, height: 20)
        container.addSubview(projectDescLabel)
        projectDescLabel.anchor(top: projectLabel.bottomAnchor, left: container.leftAnchor, bottom: nil, right: nil, center: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 0,
            paddingRight: 0, width: 250, height: 20)
        
        container.addSubview(startImageView)
        startImageView.anchor(top: projectDescLabel.bottomAnchor, left: container.leftAnchor, bottom: nil, right: nil, center: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0,
            paddingRight: 0, width: 12, height: 12)
        container.addSubview(starCountLabel)
        starCountLabel.anchor(top: projectDescLabel.bottomAnchor, left: startImageView.rightAnchor, bottom: nil, right: nil, center: nil, paddingTop: 15, paddingLeft: 5, paddingBottom: 0,
            paddingRight: 0, width: 40, height: 13)
        
        container.addSubview(typeImageView)
        typeImageView.anchor(top: projectDescLabel.bottomAnchor, left: starCountLabel.rightAnchor, bottom: nil, right: nil, center: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0,
            paddingRight: 0, width: 12, height: 12)
        container.addSubview(typeDescLabel)
        typeDescLabel.anchor(top: projectDescLabel.bottomAnchor, left: typeImageView.rightAnchor, bottom: nil, right: nil, center: nil, paddingTop: 15, paddingLeft: 5, paddingBottom: 0,
            paddingRight: 0, width: 100, height: 13)
    }
    
    let container: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "SampleUserImage")
        iv.layer.cornerRadius = profileWidthHeight/2
        iv.clipsToBounds = true
        return iv
    }()
    
    let uidLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "lpintoid"
        label.font = UIFont(name: Constants.FONT_NAME_REGULAR, size:13)
        return label
    }()
    
    let projectLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "telegraph-android"
        label.font = UIFont(name: Constants.FONT_NAME_BOLD, size:14)
        return label
    }()
    
    let projectDescLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Telegraph X is Android client"
        label.font = UIFont(name: Constants.FONT_NAME_REGULAR, size:14)
        return label
    }()
    
    lazy var startImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Star")
        return iv
    }()
    
    let starCountLabel: UILabel = {
        let label = UILabel()
        label.text = "75"
        label.textColor = .black
        label.font = UIFont(name: Constants.FONT_NAME_REGULAR, size:13)
        return label
    }()
    
    lazy var typeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Oval")
        return iv
    }()
    
    let typeDescLabel: UILabel = {
        let label = UILabel()
        label.text = "Android"
        label.textColor = .black
        label.font = UIFont(name: Constants.FONT_NAME_REGULAR, size:13)
        return label
    }()
}
