//
//  UserDataService.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/9/21.
//

import UIKit

class UserDataService {
    
    func fetchUserData(dataFeed: @escaping ((User?) -> Void)){
        Network.shared.apollo.fetch(query: SampleGitHubUserQuery()){ result in
            switch result {
            case .success(let graphQLResult):
                if let user = graphQLResult.data?.user {
                    var userObj = User()
                    userObj.name = user.name
                    userObj.email = user.email
                    userObj.bio = user.bio
                    userObj.company = user.company
                    userObj.avatarUrl = user.avatarUrl
                    userObj.followerCount = user.followers.totalCount
                    userObj.followingCount = user.following.totalCount
                    
                    var pinnedRepoArray:Array<Repository> = Array()
                    user.pinnedItems.nodes?.forEach { node in
                        guard let repository = node?.asRepository else { return }
                        
                        var repoObj:Repository = Repository()
                        repoObj.name = repository.name
                        repoObj.desc = repository.description
                        repoObj.starCount = repository.stargazerCount
                        repoObj.primaryLanguage = repository.primaryLanguage?.name
                        pinnedRepoArray.append(repoObj)
                    }
                    userObj.pinnedRepos = pinnedRepoArray
                    
                    var topRepoArray:Array<Repository> = Array()
                    user.topRepositories.nodes?.forEach { node in
                        guard let repository = node else { return }
                        
                        var repoObj:Repository = Repository()
                        repoObj.name = repository.name
                        repoObj.desc = repository.description
                        repoObj.starCount = repository.stargazerCount
                        repoObj.primaryLanguage = repository.primaryLanguage?.name
                        topRepoArray.append(repoObj)
                    }
                    userObj.topRepos = topRepoArray
                    
                    var starredRepoArray:Array<Repository> = Array()
                    user.starredRepositories.nodes?.forEach { node in
                        guard let repository = node else { return }
                        
                        var repoObj:Repository = Repository()
                        repoObj.name = repository.name
                        repoObj.desc = repository.description
                        repoObj.starCount = repository.stargazerCount
                        repoObj.primaryLanguage = repository.primaryLanguage?.name
                        starredRepoArray.append(repoObj)
                    }
                    userObj.starredRepos = starredRepoArray
                    
                    dataFeed(userObj)
                }
            case .failure(let e):
                print("Error \(e)")
                dataFeed(nil)
            }
        }
    }
    
}
