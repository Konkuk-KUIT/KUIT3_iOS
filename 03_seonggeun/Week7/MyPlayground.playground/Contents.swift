import Foundation

// 일부러 race condition 발생 시키기
var counter = 0
let queue = DispatchQueue(label: "com.example.counterQueue", attributes: .concurrent)

for _ in 1...1000001 {
    queue.async {
        counter += 1  // 스레드에서 counter를 증가
    }
    
    queue.async {
        counter -= 1  // 다른 스레드에서 counter를 감소
    }
}

queue.async(flags: .barrier) {
    print("Final Counter Value: \(counter)")
}

// Playground에서 계속 실행을 유지합니다.
DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
    print("10 seconds passed, stopping playground.")
}

// lock을 사용해서 막기

var counter1 = 0
let group = DispatchGroup()  // DispatchGroup 객체를 생성, 비동기 작업의 완료를 그룹으로 관리할 수 있게 함
let lock = NSLock()  //

// 1부터 1,000,001까지 반복, 총 2,000,002번의 비동기 작업을 생성
for _ in 1...1000001 {
    group.enter()  // DispatchGroup에 작업을 등록(작업 시작을 그룹에 알림)
    DispatchQueue.global().async {
        lock.lock()  // lock
        counter1 += 1
        lock.unlock()  // unlock
        group.leave()  // DispatchGroup에 작업 완료를 알림
    }
    
    group.enter()  // 다시 DispatchGroup에 작업을 등록
    DispatchQueue.global().async {
        lock.lock()  // lock
        counter1 -= 1
        lock.unlock()  // unlock
        group.leave()  // DispatchGroup에 작업 완료를 알림
    }
}

group.wait()  // 모든 등록된 작업들이 완료될 때까지 대기
print(counter)

