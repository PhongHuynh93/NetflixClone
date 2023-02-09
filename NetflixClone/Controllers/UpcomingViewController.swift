//
//  UpcomingViewController.swift
//  NetflixClone
//
//  Created by Huynh Phong on 04/02/2023.
//

import UIKit

class UpcomingViewController: UIViewController {

  private lazy var upcomingTable: UITableView = {
    return UITableView().apply { it in
      it.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
      it.delegate = self
      it.dataSource = self
    }
  }()

  private var data: [Movie] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Upcoming"
    navigationController?.run(block: { it in
      it.navigationBar.prefersLargeTitles = true
      it.navigationItem.largeTitleDisplayMode = .always
    })
    view.addSubview(upcomingTable)
    getData()
  }

  override func viewDidLayoutSubviews() {
    upcomingTable.frame = view.bounds
  }

  private func getData() {
    APICaller.shared.getUpcomingMovies { result in
      DispatchQueue.main.async {
        switch (result) {

        case .success(let movies):
          self.data = movies
          self.upcomingTable.reloadData()
        case .failure(let error):
          print(error)
          return
        }
      }
    }
  }

}

extension UpcomingViewController: UITableViewDelegate {

}

extension UpcomingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
      return UITableViewCell()
    }
    cell.setMovie(movie: data[indexPath.row])
    return cell
  }


}
