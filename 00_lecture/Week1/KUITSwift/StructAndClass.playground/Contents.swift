import SwiftUI

// Struct
struct Student {
    let name: String
    let grade: Int
    let address: String
    
    func printIntroduction() {
        print("안녕하세요. 저는 \(name)입니다. 현재 \(grade)학년이고, \(address)에 살고 있습니다.")
    }
}

let anjin = Student(name: "이안진", grade: 1, address: "경상북도 포항시")
let gaeun = Student(name: "유가은", grade: 2, address: "서울시 강동구")

print(anjin.grade)
print(gaeun.address)

anjin.printIntroduction()
gaeun.printIntroduction()


struct Dog {
    let name: String
    var isCute: Bool = true
}

let happy = Dog(name: "해피")
let coco = Dog(name: "코코", isCute: false)

print(happy.isCute)
print(coco.isCute)


struct Cat {
    var name: String
    var isCute: Bool
    
    init(name: String) {
        self.name = name
        self.isCute = true
    }
}


// Class

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
}

class Developer: Employee {
    func work() {
        print("저는 \(hours)시간 동안 코드를 씁니다.")
    }
}

class Manager: Employee {
    func work() {
        print("저는 \(hours)시간 동안 회의를 합니다.")
    }
}

let tina = Developer(hours: 8)
let vision = Manager(hours: 10)
tina.work()
vision.work()


/// Struct와 Class 차이는?
/// Struct 값 타입 Value type
/// Class 참조 탑입 Reference type

let hoho = tina


// 1. 기본적으로는 Struct를 사용 권장
// 2. Objective-C Interoperability가 필요할 때 Class 사용
// 3. Identity를 control할 필요가 있을 때 Class 사용
// 4. Identity를 사용하지만, control할 필요가 없다면 Struct 사용
// 5. 상속이 필요한 경우에는, Struct와 Protocol 함께 이용
