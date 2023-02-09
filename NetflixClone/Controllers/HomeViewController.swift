//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by Huynh Phong on 04/02/2023.
//

import UIKit

enum Section: Int {
  case TrendingMovies = 0
  case Popular = 1
  case TrendingTv = 2
  case Upcoming = 3
  case TopRated = 4
}

class HomeViewController: UIViewController {

  private let sectionTitles: [String] = ["Trending Movies", "Popular", "Trending Tv", "Upcoming Movies", "Top rated"]

  private lazy var homeFeedTable: UITableView = {
    return UITableView(frame: .zero, style: .grouped).apply { it in
      it.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifider)
      it.tableHeaderView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
      it.delegate = self
      it.dataSource = self
    }
  }()

  private var data: [Int: [Movie]] = [:]

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(homeFeedTable)
    configureNavBar()
    getData()
  }

  override func viewDidLayoutSubviews() {
    homeFeedTable.frame = view.bounds
  }

  private func configureNavBar() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "netflixLogo")?.letIt(block: { it in
        it.withRenderingMode(.alwaysOriginal)
      }), style: .done, target: self, action: nil)
    navigationItem.rightBarButtonItems = [
      UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
      UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil),
    ]
  }

  private func getData() {
    APICaller.shared.getTrendingMovies { result in
      DispatchQueue.main.async {
        switch (result) {
        case .success(let movies):
          self.data[Section.TrendingMovies.rawValue] = movies
          self.homeFeedTable.reloadData()
        case .failure(let error):
          print(error)
          return
        }
      }
    }
    APICaller.shared.getTrendingTvs { result in
      DispatchQueue.main.async {
        switch (result) {
        case .success(let movies):
          self.data[Section.TrendingTv.rawValue] = movies
          self.homeFeedTable.reloadData()
        case .failure(let error):
          print(error)
          return
        }
      }
    }
    APICaller.shared.getUpcomingMovies { result in
      DispatchQueue.main.async {
        switch (result) {

        case .success(let movies):
          self.data[Section.Upcoming.rawValue] = movies
          self.homeFeedTable.reloadData()
        case .failure(let error):
          print(error)
          return
        }
      }
    }
    APICaller.shared.getPopularMovies { result in
      DispatchQueue.main.async {
        switch (result) {

        case .success(let movies):
          self.data[Section.Popular.rawValue] = movies
          self.homeFeedTable.reloadData()
        case .failure(let error):
          print(error)
          return
        }
      }
    }
    APICaller.shared.getTopRatedMovies { result in
      DispatchQueue.main.async {
        switch (result) {

        case .success(let movies):
          self.data[Section.TopRated.rawValue] = movies
          self.homeFeedTable.reloadData()
        case .failure(let error):
          print(error)
          return
        }
      }
    }
  }

}

extension HomeViewController: UITableViewDelegate {

}

extension HomeViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    print("numberOfSectionsxxx \(data.count)")
    return data.count
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionTitles[section]
  }

  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    guard let header = view as? UITableViewHeaderFooterView else {
      return
    }
    header.textLabel?.run(block: { it in
      it.font = .systemFont(ofSize: 18, weight: .semibold)
      it.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
      it.text = sectionTitles[section]
    })
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifider, for: indexPath) as? CollectionViewTableViewCell else {
      print("returning xxx cell \(indexPath.row)")
      return UITableViewCell()
    }
    guard let movies = data[indexPath.section] else {
      return UITableViewCell()
    }
    cell.setMovies(movies: movies)
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }

}
