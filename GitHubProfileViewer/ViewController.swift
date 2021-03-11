//
//  ViewController.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/6/21.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {

    private let cellId = "cellId"
    private let profileHeaderCellId = "profileHeaderCellId"
    private let pinnedListCellId = "pinnedListCellId"
    private let topRepoListCellId = "topRepoListCellId"
    private let starredRepoListCellId = "starredRepoListCellId"
    
    private let SECTION_COUNT:Int = 4
    
    private var collectionView: UICollectionView!
    
    private let userPresenter: UserPresenter!
    private var displayUser: User!
    private var loader:MBProgressHUD!
    
    init(with presenter: UserPresenter) {
        self.userPresenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView(){
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ProfileHeaderCell.self, forCellWithReuseIdentifier: profileHeaderCellId)
        collectionView.register(PinnedListCell.self, forCellWithReuseIdentifier: pinnedListCellId)
        collectionView.register(TopRepoListCell.self, forCellWithReuseIdentifier: topRepoListCellId)
        collectionView.register(StarredRepoListCell.self, forCellWithReuseIdentifier: starredRepoListCellId)
        
        let refreshControl = UIRefreshControl()
        //refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView?.refreshControl = refreshControl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        userPresenter.attachView(self)
        userPresenter.fetchUser()
    }
    
    @objc func handleRefresh(){
        self.userPresenter.handleRefresh()
    }
}

extension ViewController: UserViewProtocol {
    // Set the User data after loading from the GraphQL
    func setUser(user: User) {
        displayUser = user
        collectionView.reloadData()
        collectionView?.refreshControl?.endRefreshing()
    }
    
    // Display the Progress Indicator
    func showHUD() {
        self.loader = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.loader.show(animated: true)
    }
    
    // Hides the progress indicator
    func hideHUD() {
        if ( self.loader != nil ){
            self.loader.hide(animated: true)
        }
    }
    
    func showErrorAlert() {
        AlertUtils().showErrorAlert(vc: self, message: "Error Loading the User")
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UserCell!
        
        if(indexPath.row == 0 ){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileHeaderCellId, for: indexPath) as! ProfileHeaderCell
            cell.loadWithUser(user: self.displayUser )
        } else if(indexPath.row == 1 ){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: pinnedListCellId, for: indexPath) as! PinnedListCell
            cell.loadWithUser(user: self.displayUser)
        } else if(indexPath.row == 2 ){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: topRepoListCellId, for: indexPath) as! TopRepoListCell
            cell.loadWithUser(user: self.displayUser)
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: starredRepoListCellId, for: indexPath) as! StarredRepoListCell
            cell.loadWithUser(user: self.displayUser)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Display table only after User data receive completed
        // Count will be 0 untill that
        if(displayUser != nil){
            return SECTION_COUNT
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if(indexPath.row == 0 ){
            return CGSize.init(width: view.frame.width, height: 270)
        } else if(indexPath.row == 1 ){
            return CGSize.init(width: view.frame.width, height: getPinnedCellHeight())
        } else {
            return CGSize.init(width: view.frame.width, height: 200)
        }
    }
    
    // Returns the cell height for Pinned List Cell
    // Its based on the pinned Repo count
    func getPinnedCellHeight() -> CGFloat{
        if (displayUser != nil && displayUser.pinnedRepos != nil && displayUser.pinnedRepos.count > 0 ){
            let repoCount = displayUser.pinnedRepos.count
            let headerSize:CGFloat = 50
            let cellHeight:CGFloat = 140
            
            return headerSize + ( cellHeight * CGFloat(repoCount) )
        }
        return 0
    }
}

