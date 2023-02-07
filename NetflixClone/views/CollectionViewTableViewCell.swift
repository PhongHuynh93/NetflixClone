//
//  CollectionViewTableViewCell.swift
//  NetflixClone
//
//  Created by Huynh Phong on 04/02/2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

  static let identifider = "CollectionViewTableViewCell"
  private var movies: [Movie] = []

  private let collectionView: UICollectionView = {
    return UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().apply { it in
        it.itemSize = CGSize(width: 140, height: 200)
        it.scrollDirection = .horizontal
      }).apply { it in
      it.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifider)
    }
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func layoutSubviews() {
    collectionView.frame = contentView.bounds
  }

  func setMovies(movies: [Movie]) {
    self.movies = movies
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }

}

extension CollectionViewTableViewCell: UICollectionViewDelegate {

}

extension CollectionViewTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifider, for: indexPath) as? MovieCollectionViewCell else {
      return UICollectionViewCell()
    }
    let movie = movies[indexPath.row]
    cell.load(image: movie.poster_path ?? "")
    return cell
  }


}
