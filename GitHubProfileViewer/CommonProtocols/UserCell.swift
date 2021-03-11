//
//  UserCell.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/10/21.
//
import UIKit

protocol UserCell: UICollectionViewCell {
    func loadWithUser(user:User)
}
