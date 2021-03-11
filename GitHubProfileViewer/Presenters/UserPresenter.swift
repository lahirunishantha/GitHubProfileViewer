//
//  UserPresenter.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/10/21.
//

import UIKit

protocol UserViewProtocol: NSObjectProtocol {
    func setUser( user:User )
    func showHUD()
    func hideHUD()
    func showErrorAlert()
}

class UserPresenter {
    
    fileprivate let dataService: UserDataService
    weak fileprivate var userView: UserViewProtocol?
    
    init(dataService: UserDataService) {
        self.dataService = dataService
    }
    
    func attachView(_ viewProtocol: UserViewProtocol) {
        self.userView = viewProtocol
    }
    
    func detachView() {
        self.userView = nil
    }
    
    func fetchUser() {
        userView?.showHUD()
        dataService.fetchUserData { ( user:User? ) in
            if ( user != nil ){
                self.userView?.setUser(user: user!)
                self.userView?.hideHUD()
                UserCacheService().saveUserCache(user: user!)
            } else {
                let offlineUser = UserCacheService().getUserCache()
                if( offlineUser != nil ){
                    self.userView?.setUser(user: offlineUser!)
                    self.userView?.hideHUD()
                } else {
                    self.userView?.hideHUD()
                    self.userView?.showErrorAlert()
                }
                print("came to nil")
            }
        }
        
    }
    
    func handleRefresh(){
        fetchUser()
    }
}
