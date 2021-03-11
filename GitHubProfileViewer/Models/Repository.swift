//
//  Repository.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/8/21.
//

import UIKit

struct Repository: Codable {
    var id:String!
    var name:String!
    var desc:String!
    var starCount:Int!
    var primaryLanguage:String!
}
