//
//  StoryCollectionViewCell.swift
//  UMC_study_2st_mission
//
//  Created by 오현민 on 5/21/24.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewImageViewBackground: UIView!
    @IBOutlet weak var viewuserProfileBackhround: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewImageViewBackground.layer.cornerRadius = 24
        viewuserProfileBackhround.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
    }

}
