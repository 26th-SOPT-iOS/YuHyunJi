//
//  MusicCell.swift
//  Thirdweek_Seminar
//
//  Created by hjyoo on 2020/05/09.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class MusicCell: UICollectionViewCell {
    
    static let identifier: String = "MusicCell"
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    func set(_ musicInformation: Music) {
        albumImageView.image = musicInformation.albumImg
        titleLabel.text = musicInformation.musicTitle
        singerLabel.text = musicInformation.singer
    }
}
