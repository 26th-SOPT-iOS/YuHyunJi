//
//  MyProfileCell.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/05/15.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class MyProfileCell: UITableViewCell {
    
    static let identifier: String = "MyProfileCell"
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var separateView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
