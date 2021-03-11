//
//  TopRepoListCell.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/7/21.
//

import UIKit

class TopRepoListCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UserCell {
    
    private let cellId = "topRepoItemCell"
    private let headerId = "topRepoHeaderId"
    
    private var repoList:Array<Repository>!
    private var repoUser:RepoUser!
    
    let REPO_CELL_HEIGHT:CGFloat = 140
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadWithUser(user: User) {
        if(user.topRepos != nil){
            self.repoList = user.topRepos
            var rUser = RepoUser()
            rUser.bio = user.bio
            rUser.avatarUrl = user.avatarUrl
            self.repoUser = rUser
            
        } else {
            self.repoList = Array()
        }
        
        topRepoCollectionView.reloadData()
    }
    
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cellHeader: HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topRepoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupViews(){
        cellHeader.label.text = "Top repositories"
        addSubview(cellHeader)
        addSubview(topRepoCollectionView)
        
        topRepoCollectionView.dataSource = self
        topRepoCollectionView.delegate = self
        topRepoCollectionView.register(RepoItemCell.self, forCellWithReuseIdentifier: cellId)
        
        cellHeader.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, center: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        topRepoCollectionView.anchor(top: cellHeader.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, center: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.repoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RepoItemCell
        cell.repoView.loadWithRepository(repo: self.repoList[indexPath.row], repoUser: self.repoUser)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize.init(width: 200, height: REPO_CELL_HEIGHT)
    }
}
