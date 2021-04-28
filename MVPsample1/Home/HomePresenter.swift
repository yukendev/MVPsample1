//
//  HomePresenter.swift
//  MVPsample1
//
//  Created by 手塚友健 on 2021/04/28.
//

import Foundation

protocol HomePresenterInput {
    func getAllMusics()
    func didTapSearchButton(searchWord: String?)
    func didtapMusicCell()
}

protocol HomePresenterOutput {
    func reloadMusics(musics: [Music])
}

class HomePresenter: HomePresenterInput {
    
    var view: HomePresenterOutput
    var model: GetMusicInput
    
    init(view: HomePresenterOutput, model: GetMusicInput) {
        self.view = view
        self.model = model
    }
    
    //楽曲全取得
    func getAllMusics() {
        model.getAll { (musics) in
            self.view.reloadMusics(musics: musics)
        }
    }
    
    //検索ボタンがタップされたとき
    func didTapSearchButton(searchWord: String?) {
        guard let searchWord = searchWord else { return }
        guard !searchWord.isEmpty else { return }
        model.search(searchWord: searchWord) { (musics) in
            self.view.reloadMusics(musics: musics)
        }
    }
    
    //楽曲セルがタップされた時
    func didtapMusicCell() {
        <#code#>
    }
    
    
}
