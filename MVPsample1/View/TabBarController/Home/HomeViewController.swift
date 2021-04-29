//
//  HomeViewController.swift
//  MVPsample1
//
//  Created by 手塚友健 on 2021/04/28.
//

import UIKit

protocol MusicCellDelegate {
    func toMusicDetail(musicID: String)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var musics: [Music] = []
    
    var presenter: HomePresenterInput!
    
    func inject(presenter: HomePresenter) {
        self.presenter = presenter
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        title = "Home!"
        
        navigationItem.title = "Home"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "musicCell")
        
        presenter.getAllMusics()
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell") as! MusicTableViewCell
        let music = musics[indexPath.row]
        
        cell.music = music
        
        cell.musicTitleLabel.text = music.title
        
        cell.delegate = self
        
        return cell
    }
    
    
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapMusicCell(selectedMusic: musics[indexPath.row], musics: self.musics)
    }
}


extension HomeViewController: HomePresenterOutput {
    func reloadMusics(musics: [Music]) {
        self.musics = musics
        self.tableView.reloadData()
    }
}


extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.didTapSearchButton(searchWord: searchBar.text)
    }
}


extension HomeViewController: MusicCellDelegate {
    func toMusicDetail(musicID: String) {
        print("IDが\(musicID)の楽曲詳細へ遷移します")
    }
}
