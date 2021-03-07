//
//  HeaderView.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/7/21.
//

import UIKit

class HeaderView: UIView {
    var label: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont(name: Constants.FONT_NAME_BOLD, size:20)
        label.sizeToFit()
        label.textColor = .black
        return label
    }()
   
   var button: UIButton = {
       let btn: UIButton = UIButton()
       btn.sizeToFit()
       return btn
   }()

   let buttonAttributes: [NSAttributedString.Key: Any] = [
       .font: UIFont(name: Constants.FONT_NAME_BOLD, size:14) as Any,
         .foregroundColor: UIColor.black,
         .underlineStyle: NSUnderlineStyle.single.rawValue]
   
   override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
       
        addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
       
        let attributeString = NSMutableAttributedString(string: "View all", attributes: buttonAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        
   }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}
