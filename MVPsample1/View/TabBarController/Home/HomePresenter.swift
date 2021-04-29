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
    func didTapMusicCell(selectedMusic: Music, musics: [Music])
}

protocol HomePresenterOutput {
    func reloadMusics(musics: [Music])
}

class HomePresenter: HomePresenterInput {
    
    
    var view: HomePresenterOutput
    var getMusicModel: GetMusicModelInput
    var playMusicModel: PlayMusicModel
    
    init(view: HomePresenterOutput, getMusicModel: GetMusicModelInput, playMusicModel: PlayMusicModel) {
        self.view = view
        self.getMusicModel = getMusicModel
        self.playMusicModel = playMusicModel
    }
    
    //楽曲全取得
    func getAllMusics() {
        getMusicModel.getAll { (musics) in
            self.view.reloadMusics(musics: musics)
        }
    }
    
    //検索ボタンがタップされたとき
    func didTapSearchButton(searchWord: String?) {
        guard let searchWord = searchWord else { return }
        guard !searchWord.isEmpty else { return }
        getMusicModel.search(searchWord: searchWord) { (musics) in
            self.view.reloadMusics(musics: musics)
        }
    }
    
    //楽曲セルがタップされた時
    func didTapMusicCell(selectedMusic: Music, musics: [Music]) {
        //全ての楽曲を、選択された楽曲を0番目とした配列に整形
        guard let selectedIndex = musics.firstIndex(where: { $0.id == selectedMusic.id }) else {
            return
        }
        let willPlayMusics: [Music] = musics.suffix(musics.count - selectedIndex)
        playMusicModel.setUpMusics(musics: willPlayMusics)
        playMusicModel.playMusic()
    }
    
    
}
