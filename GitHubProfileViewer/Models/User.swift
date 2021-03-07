//
//  User.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/8/21.
//

import UIKit

class User: NSObject {
    var name:String!
    var email:String!
    var bio:String!
    var followerCount:Int!
    var followingCount:Int!
    
    var pinnedRepos:Array<Repository>!
    var topRepos:Array<Repository>!
    var starredRepos:Array<Repository>!
}
