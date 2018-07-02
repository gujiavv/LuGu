//
//  FallImageCell.swift
//  LuGu
//
//  Created by 111 on 2018/6/12.
//  Copyright © 2018年 mars. All rights reserved.
//

import UIKit
import Kingfisher
class FallImageCell: UICollectionViewCell {

    @IBOutlet weak var fallImageView: UIImageView!
    @IBOutlet weak var loadImageErrorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fallImageView.image = nil
        loadImageErrorLabel.isHidden = true
    }
    
    func configureWithImageUrl(imageUrl:String,collectionView:UICollectionView,indexPath:IndexPath) {
        if !imageUrl.isEmpty {
            let url = URL(string: imageUrl)
            fallImageView.kf.setImage(with: ImageResource.init(downloadURL: url!))
            loadImageErrorLabel.isHidden = true
        }else{
            fallImageView.image = UIImage(named:"GuLuLogo")
            loadImageErrorLabel.isHidden = false
        }
      
    }
}
