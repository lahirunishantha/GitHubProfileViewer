//
//  ViewController.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/6/21.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    private let profileHeaderCellId = "profileHeaderCellId"
    private let pinnedListCellId = "pinnedListCellId"
    private let topRepoListCellId = "topRepoListCellId"
    private let starredRepoListCellId = "starredRepoListCellId"
    
    // initialized with a non-nil layout parameter
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        collectionView.register(ProfileHeaderCell.self, forCellWithReuseIdentifier: profileHeaderCellId)
        collectionView.register(PinnedListCell.self, forCellWithReuseIdentifier: pinnedListCellId)
        collectionView.register(TopRepoListCell.self, forCellWithReuseIdentifier: topRepoListCellId)
        collectionView.register(StarredRepoListCell.self, forCellWithReuseIdentifier: starredRepoListCellId)
        collectionView.register(SampleCell.self, forCellWithReuseIdentifier: cellId)
        
        callUserQuery()
    }
    
    //This is a test function to get the user data have to move this to a service class
    func callUserQuery(){
        Network.shared.apollo.fetch(query: SampleGitHubUserQuery()){ result in
            switch result {
            case .success(let graphQLResult):
                if let user = graphQLResult.data?.user {
                    print("user data \(user)")
                }
            case .failure(let e):
                print("Error \(e)")
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:UICollectionViewCell
        
        if(indexPath.row == 0 ){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileHeaderCellId, for: indexPath) as! ProfileHeaderCell
        } else if(indexPath.row == 1 ){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: pinnedListCellId, for: indexPath) as! PinnedListCell
        } else if(indexPath.row == 2 ){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: topRepoListCellId, for: indexPath) as! TopRepoListCell
        } else if(indexPath.row == 3 ){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: starredRepoListCellId, for: indexPath) as! StarredRepoListCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SampleCell
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.row == 0 ){
            return CGSize.init(width: view.frame.width, height: 270)
        } else if(indexPath.row == 1 ){
            return CGSize.init(width: view.frame.width, height: 460)
        } else {
            return CGSize.init(width: view.frame.width, height: 200)
        }
    }
}

class SampleCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = .gray
    }
}

