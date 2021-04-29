//
//  MainTabBarController.swift
//  MVPsample1
//
//  Created by 手塚友健 on 2021/04/28.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
}

extension MainTabBarController {
    private func setUp() {
        let homeStoryBoard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = homeStoryBoard.instantiateViewController(withIdentifier: "home") as! HomeViewController
        homeVC.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house.fill"), tag: 0)
        let getMusicModel: GetMusicModel = GetMusicModel()
        let playMusicModel: PlayMusicModel = PlayMusicModel()
        let presenter = HomePresenter(view: homeVC, getMusicModel: getMusicModel, playMusicModel: playMusicModel)
        homeVC.inject(presenter: presenter)
        
        let homeNavigationController = UINavigationController(rootViewController: homeVC)
        
        
        let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "profile")
        profileVC.tabBarItem = UITabBarItem(title: "profile", image: UIImage(systemName: "person.fill"), tag: 0)
        viewControllers = [homeNavigationController, profileVC]
    }
}
