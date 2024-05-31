//
//  UserAPI.swift
//  Week8App
//
//  Created by 정아현 on 5/24/24.
//

import Foundation
import Alamofire

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let age: Int
}

class UserAPI {
    let url = "https://66503d7dec9b4a4a60313c6d.mockapi.io/user"
    
    // 유저 조회
    func getUser(completion: @escaping (_ users: [User]) -> Void) {
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default)
        
        dataRequest.responseDecodable(of: [User].self) { response in
            switch response.result {
            case .success(let response):
                print("Success: \(response)")
                completion(response)
            case .failure(let error):
                print("debug error: \(error)")
            }
        }
    }
    
    // 유저 생성
    func createUser(user: User, completion: @escaping (_ user: User) -> Void) {
        let dataRequest = AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default)
        
        dataRequest.responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let response):
                print("User created: \(response)")
                completion(response)
            case .failure(let error):
                print("debug error: \(error)")
            }
        }
    }
    
    // 유저 삭제
    func deleteUser(userId: String, completion: @escaping (_ success: Bool) -> Void) {
        let dataRequest = AF.request("\(url)/\(userId)", method: .delete)
        
        dataRequest.response { response in
            switch response.result {
            case .success:
                print("User deleted: \(userId)")
                completion(true)
            case .failure(let error):
                print("debug error: \(error)")
                completion(false)
            }
        }
    }

}
