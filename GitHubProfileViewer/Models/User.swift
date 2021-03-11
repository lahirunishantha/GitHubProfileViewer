//
//  User.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/8/21.
//

import UIKit

struct User:Codable {
    var name:String!
    var email:String!
    var bio:String!
    var company:String!
    var avatarUrl:String!
    var followerCount:Int!
    var followingCount:Int!
    
    var pinnedRepos:Array<Repository>!
    var topRepos:Array<Repository>!
    var starredRepos:Array<Repository>!
}

struct RepoUser {
    var bio:String!
    var avatarUrl:String!
}
