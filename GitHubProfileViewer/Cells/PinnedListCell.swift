//
//  PinnedCell.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/7/21.
//

import UIKit

class PinnedListCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UserCell {
    
    private let cellId = "pinnedItemCell"
    private let headerId = "pinnedHeaderId"
    private var repoList:Array<Repository>!
    private var repoUser:RepoUser!
    
    let REPO_CELL_HEIGHT:CGFloat = 130
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadWithUser(user: User) {
        if(user.pinnedRepos != nil){
            self.repoList = user.pinnedRepos
            var rUser = RepoUser()
            rUser.bio = user.bio
            rUser.avatarUrl = user.avatarUrl
            self.repoUser = rUser
            
        } else {
            self.repoList = Array()
        }
        
        pinnedCollectionView.reloadData()
    }
    
    let pinnedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupViews(){
        addSubview(pinnedCollectionView)
        
        pinnedCollectionView.dataSource = self
        pinnedCollectionView.delegate = self
        pinnedCollectionView.isScrollEnabled = false
        pinnedCollectionView.register(PinnedItemCell.self, forCellWithReuseIdentifier: cellId)
        pinnedCollectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        pinnedCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, center: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.repoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PinnedItemCell
        cell.repoView.loadWithRepository(repo: self.repoList[indexPath.row], repoUser: self.repoUser)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize.init(width: frame.width, height: REPO_CELL_HEIGHT)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! SectionHeader
        sectionHeader.label.text = "Pinned"
        return sectionHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}

