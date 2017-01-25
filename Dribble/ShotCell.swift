//
//  ShotCell.swift
//  Dribble
//
//  Created by Tarang Hirani on 1/1/17.
//  Copyright © 2017 Tarang Hirani. All rights reserved.
//

import UIKit
import Kingfisher

class ShotCell: UICollectionViewCell {
    
    @IBOutlet weak var shotImageView: UIImageView!
    var shot: DribbbleShotsModel! {
        didSet {
            guard let shot = shot else { return }
            self.setupCell(shot)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width:0, height: 2.0)
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false

    }
    
    func setupCell(_ shot: DribbbleShotsModel) {
        
        guard let shotURL = DribbbleShotsModel.returnValidShotURL(urls: shot.imgUrls) else {
            return
        }
        
        shotImageView.kf.setImage(with: shotURL)
    }

}
