//
//  ProfileHeaderCellCollectionViewCell.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/6/21.
//

import UIKit
import Kingfisher

class ProfileHeaderCell: UICollectionViewCell, UserCell {
    
    let profileWidthHeight:CGFloat = 80
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadWithUser(user:User){
        self.nameLabel.text = user.name
        self.uidLabel.text = user.bio
        self.emailLabel.text = user.email
        self.followerCountLabel.text = user.followerCount.description
        self.followingCountLabel.text = user.followingCount.description
        self.profileImageView.kf.setImage(with: URL(string: user.avatarUrl))
    }
    
    func setupViews(){
        addSubview(headerLabel)
        headerLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, center: centerXAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0,
            paddingRight: 0, width: 150, height: 30)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: headerLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, center: nil, paddingTop: 50, paddingLeft: 15, paddingBottom: 0,
            paddingRight: 0, width: profileWidthHeight, height: profileWidthHeight)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, center: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0,
            paddingRight: 0, width: 250, height: 25)
        
        addSubview(uidLabel)
        uidLabel.anchor(top: nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, center: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 0,
            paddingRight: 0, width: 250, height: 15)
        
        addSubview(emailLabel)
        emailLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, center: nil, paddingTop: 25, paddingLeft: 15, paddingBottom: 0,
            paddingRight: 0, width: 250, height: 20)
        
        addSubview(followerCountLabel)
        followerCountLabel.anchor(top: emailLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, center: nil, paddingTop: 20, paddingLeft: 15, paddingBottom: 0,
            paddingRight: 0, width: 25, height: 20)
        addSubview(followerLabel)
        followerLabel.anchor(top: emailLabel.bottomAnchor, left: followerCountLabel.rightAnchor, bottom: nil, right: nil, center: nil, paddingTop: 20, paddingLeft: 5, paddingBottom: 0,
            paddingRight: 0, width: 70, height: 20)
        
        addSubview(followingCountLabel)
        followingCountLabel.anchor(top: emailLabel.bottomAnchor, left: followerLabel.rightAnchor, bottom: nil, right: nil, center: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0,
            paddingRight: 0, width: 15, height: 20)
        addSubview(followingLabel)
        followingLabel.anchor(top: emailLabel.bottomAnchor, left: followingCountLabel.rightAnchor, bottom: nil, right: nil, center: nil, paddingTop: 20, paddingLeft: 5, paddingBottom: 0,
            paddingRight: 0, width: 70, height: 20)
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Profile"
        label.font = UIFont(name: Constants.FONT_NAME_REGULAR, size:20)
        return label
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
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Lahiru Pinto"
        label.textColor = .black
        label.font = UIFont(name: Constants.FONT_NAME_BOLD, size:25)
        return label
    }()
    
    let uidLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "lpintoid"
        label.font = UIFont(name: Constants.FONT_NAME_REGULAR, size:13)
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "lahirunishantha@gmail.com"
        label.font = UIFont(name: Constants.FONT_NAME_BOLD, size:14)
        return label
    }()
    
    
    let followerCountLabel: UILabel = {
        let label = UILabel()
        label.text = "37"
        label.textColor = .black
        label.font = UIFont(name: Constants.FONT_NAME_BOLD, size:14)
        label.adjustsFontSizeToFitWidth = true //temp fix for big counts
        return label
    }()
    
    let followerLabel: UILabel = {
        let label = UILabel()
        label.text = "followers"
        label.textColor = .black
        label.font = UIFont(name: Constants.FONT_NAME_REGULAR, size:14)
        return label
    }()
    
    let followingCountLabel: UILabel = {
        let label = UILabel()
        label.text = "67"
        label.textColor = .black
        label.font = UIFont(name: Constants.FONT_NAME_BOLD, size:14)
        label.adjustsFontSizeToFitWidth = true //temp fix for big counts
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "following"
        label.textColor = .black
        label.font = UIFont(name: Constants.FONT_NAME_REGULAR, size:14)
        return label
    }()
}
