//
//  RepoItemCell.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/7/21.
//

import UIKit

class RepoItemCell: UICollectionViewCell {
    let profileWidthHeight:CGFloat = 32
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let repoView = RepoView()
    
    func setupViews(){
        addSubview(repoView)
        repoView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, center: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0,
            paddingRight: 0, width: 0, height: 0)
    }
}
