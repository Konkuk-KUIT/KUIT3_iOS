//
//  UserAPI.swift
//  Week8
//
//  Created by 가은 on 5/18/24.
//

import Alamofire
import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let age: Int
}

class UserAPI {
    let url = "https://6647877a2bb946cf2f9e11b6.mockapi.io/user"
    
    func getUser(completion: @escaping (_ users: [User]) -> Void ) {
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default)
            
        dataRequest.responseDecodable(of: [User].self) { response in
            switch response.result {
            case .success(let response):
                print("success: \(response)")
                completion(response)
            case .failure(let error):
                print("debug error: \(error)")
            }
        }
    }
}
