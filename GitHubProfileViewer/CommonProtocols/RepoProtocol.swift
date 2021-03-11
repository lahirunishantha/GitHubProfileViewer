//
//  RepoCell.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/11/21.
//

import UIKit

protocol RepoProtocol: UIView {
    func loadWithRepository(repo:Repository, repoUser:RepoUser)
}
