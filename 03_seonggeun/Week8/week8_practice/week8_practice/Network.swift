//
//  Network.swift
//  week8_practice
//
//  Created by 박성근 on 5/24/24.
//

import Foundation
import Alamofire

struct Player: Codable {
    let id: String
    let name: String
    let age: Int
    let team: String
}

class PlayerAPI {
    
    let url = "https://66508e96ec9b4a4a603284ad.mockapi.io/api/v1/player"
    
    func getPlayer() {
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default)
        
        dataRequest.responseDecodable(of: [Player].self) { response in
            switch response.result {
            case .success(let response):
                print("success: \(response)")
            case .failure(let error):
                print("debug error: \(error)")
            }}
    }
     
    func updatePlayer(player: Player) {
            let updateURL = "\(url)/\(player.id)"
            let dataRequest = AF.request(updateURL, method: .put, parameters: player, encoder: JSONParameterEncoder.default)
            
            dataRequest.responseDecodable(of: Player.self) { response in
                switch response.result {
                case .success(let updatedPlayer):
                    print("success: \(updatedPlayer)")
                case .failure(let error):
                    print("debug error: \(error)")
                }
            }
        }
        
        func deletePlayer(playerID: String) {
            let deleteURL = "\(url)/\(playerID)"
            let dataRequest = AF.request(deleteURL, method: .delete)
            
            dataRequest.response { response in
                switch response.result {
                case .success:
                    print("success: player deleted")
                case .failure(let error):
                    print("debug error: \(error)")
                }
            }
        }
}
