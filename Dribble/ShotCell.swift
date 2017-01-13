//
//  ShotCell.swift
//  Dribble
//
//  Created by Tarang Hirani on 1/1/17.
//  Copyright © 2017 Tarang Hirani. All rights reserved.
//

import UIKit

class ShotCell: UICollectionViewCell {
    
    var shot: DribbbleShotsModel?
    
    override func awakeFromNib() {
        

        super.awakeFromNib()
        // Initialization code
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.red
        self.layer.cornerRadius = CGFloat(5)
        self.layer.masksToBounds = false
        
    }

}
