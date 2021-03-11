//
//  UserCacheService.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/11/21.
//

import UIKit

class UserCacheService: NSObject {
    let SAVED_USER:String = "SAVED_USER"
    let LAST_SAVE_TIME:String = "LAST_SAVE_TIME"
    let CACHE_VALID_HOURS:Int = -24
    
    func saveUserCache(user:User){
        saveUserToLocal(user: user)
        UserDefaults.standard.set(Date(), forKey: LAST_SAVE_TIME)
    }
    
    func getUserCache() -> User? {
        if (isCachedTimeValid(cachedTime: getLastCacheTime())){
            return getUserFromLocal()
        }
        
        return nil
    }
    
    func isCachedTimeValid(cachedTime:Date) -> Bool{
        let today = Date()
        let cacheExpireTime = Calendar.current.date(byAdding: .hour, value: CACHE_VALID_HOURS, to: today)!
        
        return ( cachedTime >= cacheExpireTime )
    }
    
    func getLastCacheTime() -> Date {
        let date = UserDefaults.standard.object(forKey: LAST_SAVE_TIME) as! Date
        return date
    }
    
    func saveUserToLocal(user:User){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: SAVED_USER)
            defaults.synchronize()
        }
    }
    
    func getUserFromLocal() -> User{
        let defaults = UserDefaults.standard
        if let savedUser = defaults.object(forKey: SAVED_USER) as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                return loadedUser
            }
        }
        
        return User()
    }
}
