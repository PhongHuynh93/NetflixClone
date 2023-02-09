//
//  TitleTableViewCell.swift
//  NetflixClone
//
//  Created by Huynh Phong on 08/02/2023.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

  static let identifier = "TitleTableViewCell"

  private let posterImageView: UIImageView = {
    return UIImageView().apply { it in
      it.contentMode = .scaleAspectFill
      it.translatesAutoresizingMaskIntoConstraints = false
    }
  }()

  private let titleLabel: UILabel = {
    return UILabel().apply { it in
      it.translatesAutoresizingMaskIntoConstraints = false
    }
  }()

  private let playButton: UIButton = {
    return UIButton().apply { it in
      it.translatesAutoresizingMaskIntoConstraints = false
    }
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(posterImageView)
    contentView.addSubview(titleLabel)
    contentView.addSubview(playButton)
    applyConstraint()
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  private func applyConstraint() {
    let posterConstraints = [
      posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
      posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
      posterImageView.widthAnchor.constraint(equalToConstant: 100)
    ]
    let titleConstraints = [
      titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ]
    NSLayoutConstraint.activate(titleConstraints)
    NSLayoutConstraint.activate(posterConstraints)
  }

  func setMovie(movie: Movie) {
    titleLabel.text = movie.original_title ?? movie.original_name ?? "Unknown  title name"
    guard let imageUrl = movie.poster_path else {
      return
    }
    posterImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(imageUrl)"))
  }

}
