//
//  MovieCollectionViewCell.swift
//  NetflixClone
//
//  Created by Huynh Phong on 06/02/2023.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {

  static let identifider = "MovieCollectionViewCell"

  private let posterImageView: UIImageView = {
    return UIImageView().apply { it in
      it.contentMode = .scaleAspectFill
    }
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(posterImageView)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func layoutSubviews() {
    posterImageView.frame = contentView.bounds
  }

  func load(image: String) {
    posterImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(image)"))
  }
  
}
