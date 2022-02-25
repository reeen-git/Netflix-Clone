//
//  TitleCollectionViewCell.swift
//  NetflixClone
//
//  Created by 高橋蓮 on 2022/02/25.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifer = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleToFill
        return imageview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {return}
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
