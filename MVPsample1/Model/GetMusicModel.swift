//
//  GetMusic.swift
//  MVPsample1
//
//  Created by 手塚友健 on 2021/04/28.
//

import Foundation
import Alamofire


//presenterから移譲される処理
protocol GetMusicModelInput {
    func search(searchWord: String, completion: @escaping(_ musics: [Music]) -> Void)
    func getAll(completion: @escaping(_ musics: [Music]) -> Void)
}


class GetMusicModel: GetMusicModelInput {
    //検索処理
    func search(searchWord: String, completion: @escaping ([Music]) -> Void) {
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        AF.request(BASE_URL + GET_SEARCHED_MUSIC(searchWord: searchWord), method: .get, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(_):
                
                guard let data = response.data else{
                    return
                }
                
                do {
                    let decodedMusics: MusicList = try JSONDecoder().decode(MusicList.self, from: data)
                    completion(decodedMusics.results)
                }catch{
                    print("error")
                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    //全取得処理
    func getAll(completion: @escaping ([Music]) -> Void) {
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        AF.request(BASE_URL + GET_ALL_MUSIC, method: .get, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(_):
                
                guard let data = response.data else{
                    return
                }
                
                do {
                    let decodedMusics: MusicList = try JSONDecoder().decode(MusicList.self, from: data)
                    completion(decodedMusics.results)
                }catch{
                    print("error")
                }
            case .failure(_):
                print("error")
            }
        }
    }
}
