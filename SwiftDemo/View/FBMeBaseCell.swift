//
//  FBMeBaseCell.swift
//  SwiftDemo
//
//  Created by gjh on 14/12/2020.
//

import UIKit

class FBMeBaseCell: UITableViewCell {
    static let ID = "FBMeBaseCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Specs.color.white
        textLabel?.textColor = Specs.color.black
        textLabel?.font = Specs.font.large
        
        detailTextLabel?.textColor = Specs.color.gray
        detailTextLabel?.font = Specs.font.small
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
