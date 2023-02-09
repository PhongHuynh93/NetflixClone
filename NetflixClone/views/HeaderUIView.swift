//
//  HeaderUIView.swift
//  NetflixClone
//
//  Created by Huynh Phong on 04/02/2023.
//

import UIKit

class HeaderUIView: UIView {

  private let heroImageView: UIImageView = {
    return UIImageView().apply { it in
      it.contentMode = .scaleAspectFit
      it.clipsToBounds = true
      it.image = UIImage(named: "heroImage")
    }
  }()

  private let playBtn: UIButton = {
    return UIButton().apply { it in
      it.setTitle("Play", for: .normal)
      it.layer.borderColor = UIColor.white.cgColor
      it.layer.borderWidth = 1
      it.translatesAutoresizingMaskIntoConstraints = false
    }
  }()

  private let downloadBtn: UIButton = {
    return UIButton().apply { it in
      it.setTitle("Download", for: .normal)
      it.layer.borderColor = UIColor.white.cgColor
      it.layer.borderWidth = 1
      it.translatesAutoresizingMaskIntoConstraints = false
    }
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(heroImageView)
    addGradient()
    addSubview(playBtn)
    addSubview(downloadBtn)
    applyConstraint()
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func layoutSubviews() {
    heroImageView.frame = bounds
  }

  func addGradient() {
    let gradientLayer = CAGradientLayer().apply { it in
      it.colors = [
        UIColor.clear.cgColor,
        UIColor.black.cgColor
      ]
      it.frame = bounds
    }
    layer.addSublayer(gradientLayer)
  }

  private func applyConstraint() {
    let playBtnConstraints = [
      playBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
      playBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
      playBtn.widthAnchor.constraint(equalToConstant: 100)
    ]
    let downloadBtnConstraints = [
      downloadBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
      downloadBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
      downloadBtn.widthAnchor.constraint(equalToConstant: 100)
    ]
    NSLayoutConstraint.activate(playBtnConstraints)
    NSLayoutConstraint.activate(downloadBtnConstraints)
  }

}
