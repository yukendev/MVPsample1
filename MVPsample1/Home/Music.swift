//
//  Music.swift
//  MVPsample1
//
//  Created by 手塚友健 on 2021/04/28.
//

import Foundation
import Alamofire

struct Music: Codable {
    
    var id: String
    var title: String
    var img: String?
    var imgData: Data? {
        if img != nil {
            do {
                let data = try Data(contentsOf: URL(string: img!)!)
                return data
            }catch{
                print("error")
            }
        }
        return nil
    }
    var music: String
    
}
