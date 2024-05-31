//
//  Alamofire.swift
//  URLSessionProject
//
//  Created by 임지성 on 5/23/24.
//

import Alamofire
import SwiftUI

struct Book: Codable {
    let id: String
    let title: String
    let genre: String
    let price: Int
}

class BookAPI {
    let url = "https://6648825f2bb946cf2fa0d0fa.mockapi.io/books"
    
    func getBook() async throws -> [Book] {
        //async/await가 도입된 이후로는 콜백(completion handler)보다는 async/await을 통해
        //비동기 작업을 수행하는게 권장된다고 함
        do {
            let dataRequest = AF.request(url, method: .get)
            let response = try await dataRequest.serializingDecodable([Book].self).value
            print("Success: \(response)")
            return response
        } catch {
            print("Debug error: \(error)")
            throw error
        }
    }
    
    func postRequest(count: Int) async {
        let parameters: Parameters = [
            //POST요청을 할 때 id값은 지정하지 않음
            //데이터베이스나 서버가 자동으로 고유한 id를 생성하고 할당함
            "title": "Alamofire Post Request \(count)",
            "genre": "SF",
            "price": 10_000
        ]
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header)
            .validate(statusCode: 200 ..< 300) //유효성 검사
            .responseData { response in
                switch response.result {
                case .success:
                    print("POST 요청 성공")
                case .failure:
                    print(response.error.debugDescription)
                }
            }
    }
    
    func deleteRequest() async {
        let deleteUrl = "https://6648825f2bb946cf2fa0d0fa.mockapi.io/books/9"
        //대부분의 REST API는 리소스의 ID를 사용하여 특정 항목을 삭제할 것을 요구함
        //url의 마지막에 9가 delete할 항목의 ID값
        
        AF.request(deleteUrl, method: .delete)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success:
                    print("DELETE 요청 성공")
                case .failure:
                    print(response.error.debugDescription)
                }
            }
    }
}

struct AlamofirePractice: View {
    @State private var books: [Book] = []
    @State private var count = 0
    
    var body: some View {
        ScrollView {
            ForEach(books, id: \.self.id) { book in
                Text("book id: \(book.id)")
            }
            
            Button("Update Books Array") {
                Task { //비동기 작업 수행(메서드 호출할 때 await로 호출)
                    do {
                        books = try await BookAPI().getBook()
                    } catch {
                        print("API Failed: \(error)")
                    }
                }
            }
            
            Button("Request Post Method") {
                Task {
                    await BookAPI().postRequest(count: count)
                    count += 1
                }
            }
            
            Button("Request Delete Method") {
                Task {
                    await BookAPI().deleteRequest()
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    AlamofirePractice()
}

