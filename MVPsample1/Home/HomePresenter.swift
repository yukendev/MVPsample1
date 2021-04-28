//
//  HomePresenter.swift
//  MVPsample1
//
//  Created by 手塚友健 on 2021/04/28.
//

import Foundation

protocol HomePresenterInput {
    func getAllMusics()
    func searchMusics()
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
    
    
    func getAllMusics() {
        model.getAll { (musics) in
            self.view.reloadMusics(musics: musics)
        }
    }
    
    func searchMusics() {
        print("検索条件にあった楽曲を取得")
    }
    
    
}
