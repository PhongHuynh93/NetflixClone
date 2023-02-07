//
//  ViewController.swift
//  NetflixClone
//
//  Created by Huynh Phong on 04/02/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let vc1 = UINavigationController(rootViewController: HomeViewController()).apply { it in
      it.tabBarItem.image = UIImage(systemName: "house")
      it.title = "Home"
    }
    let vc2 = UINavigationController(rootViewController: UpcomingViewController()).apply { it in
      it.tabBarItem.image = UIImage(systemName: "play.circle")
      it.title = "Coming Soon"
    }
    let vc3 = UINavigationController(rootViewController: SearchViewController()).apply { it in
      it.tabBarItem.image = UIImage(systemName: "magnifyingglass")
      it.title = "Top Search"
    }
    let vc4 = UINavigationController(rootViewController: DownloadsViewController()).apply { it in
      it.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
      it.title = "Downloads"
    }
    setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    tabBar.tintColor = .label
  }


}

