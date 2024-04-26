//
//  CustomCollectionViewCell.swift
//  DGMarket_Home
//
//  Created by 오현민 on 4/27/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var chatImageView: UIImageView!
    @IBOutlet weak var chatNumberLabel: UILabel!
    @IBOutlet weak var dibsImageView: UIImageView!
    @IBOutlet weak var dibsNumberLabel: UILabel!
    
    func configure(_ post: PostModel) {
        titleLabel.text = post.title
        categoryLabel.text = post.category
        productImageView.image = UIImage(named: post.imageName)
        productImageView.layer.masksToBounds = true
        productImageView.layer.cornerRadius = 7
        priceLabel.text = "\(covertToCurrencyFormat(price: post.price))원"
        
        if post.chatNum <= 0 {
            chatImageView.tintColor = UIColor.white
            chatNumberLabel.text = ""
        } else {
            chatImageView.tintColor = UIColor.lightGray
            chatNumberLabel.text = "\(post.chatNum)"
        }
            
        if post.dibsNum <= 0 {
            dibsImageView.tintColor = UIColor.white
            dibsNumberLabel.text = ""
        } else {
            dibsImageView.tintColor = UIColor.lightGray
            dibsNumberLabel.text = "\(post.dibsNum)"
        }
        
    }
    
    func covertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits=0
        let result = numberFormatter.string(from: NSNumber(value:price)) ?? ""
        return result
    }
}
