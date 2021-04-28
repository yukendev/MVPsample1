//
//  PlayMusicModel.swift
//  MVPsample1
//
//  Created by 手塚友健 on 2021/04/28.
//

import Foundation
import AVFoundation

//AVAudioPlayerをグローバルで保持
internal var audioPlayer: AVAudioPlayer!

protocol MusicPlayerModelInput {
    func setUpMusics(musics: [Music])
    func playMusic()
}

class PlayMusicModel:NSObject, MusicPlayerModelInput, AVAudioPlayerDelegate {
    
    var count: Int = 0
    var musics: [Music] = []
    
    //自身の配列を設定
    func setUpMusics(musics: [Music]) {
        self.musics = musics
    }
    
    //AVAudioPlayerをインスタンス化
    private func prepareMusic(music: Music) throws {
        do {
            let data = try Data(contentsOf: URL(string: music.music)!)
            audioPlayer = try AVAudioPlayer(data: data)
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
        }catch{
            //楽曲データがない
            throw MusicError.musicNotFound
        }
    }
    
    //楽曲再生処理
    func playMusic() {
        do {
            try prepareMusic(music: musics[count])
            audioPlayer.play()
        } catch {
            //楽曲データがない
            print("楽曲データが見つかりません")
        }
    }
    
    //次の楽曲再生処理
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        count += 1
        if count > musics.count - 1 {
            //countが配列の範囲を超えたら最初から
            count = 0
        }
        playMusic()
    }
    
}
