import SwiftUI

var greeting = "Hello, playground"

DispatchQueue.global(qos: .background).async {
    for item in 1...10 {
        print("Async (1) : \(item)")
    }
}

DispatchQueue.global(qos: .utility).async {
    for item in 20...30 {
        print("Async (2) : \(item)")
    }
}

DispatchQueue.global(qos: .unspecified).async {
    for item in 40...50 {
        print("Async (3) : \(item)")
    }
}

DispatchQueue.global(qos: .default).async {
    for item in 40...50 {
        print("Async (3) : \(item)")
    }
}


// 동기 작업에선 우선순위 상관없이 호출한 순서가 우선됨
//DispatchQueue.global(qos: .background).sync {
//    for item in 1...10 {
//        print("Sync (1) : \(item)")
//    }
//}
//
//DispatchQueue.global(qos: .utility).sync {
//    for item in 20...30 {
//        print("Sync (2) : \(item)")
//    }
//}
//
//DispatchQueue.global(qos: .default).sync {
//    for item in 40...50 {
//        print("Sync (3) : \(item)")
//    }
//}

for item in 60...70 {
    print(item)
}
