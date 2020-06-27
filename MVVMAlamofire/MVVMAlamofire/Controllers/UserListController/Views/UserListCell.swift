//
//  UserListCell.swift
//  MVVMAlamofire
//
//  Created by iOS Guru on 26/06/20.
//  Copyright © 2020 iOS Guru. All rights reserved.
//

import UIKit

class UserListCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    
    var userModel: UserList? {
        didSet {
            userConfigration()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func userConfigration() {
        let user = userModel
        lblTitle.text = userModel?.title
    }
    
}
