//
//  ContentView.swift
//  DispatchProject
//
//  Created by 임지성 on 5/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Print Serial Queue", action: serialQueue)
            Button("Print Concurrent Queue", action: concurrentQueue)
            Button("Print async execution time") {
                measureExecutionTime(of: asyncExecutionTime)
            }
            Button("Print async execution time") {
                measureExecutionTime(of: syncExecutionTime)
            }
            Button("Main Thread", action: mainThread)
        }
        .padding()
    }
}


func serialQueue() {
    let queue = DispatchQueue(label: "Queue")
    
    //DispatchQueue를 serial하게 하나만 만들고, 거기에 3개의 task를 async하게 보냄
    //-> task 3개가 하나의 Dispatch Queue에 FIFO로 들어가고, 이 Dispatch Queue는 serial하므로
    //🐻‍❄️1~6,🦊1~6,🐤1~6이 항상 이 순서대로 출력됨
    //작업 순서는 이 순서대로 나오지만 🐻‍❄️, 🦊, 🐤 task를 맡은 스레드는 다를 수 있음
    //(serial은 task의 순서가 순차적으로 고정된 거지 하나의 스레드만 사용하는 건 아님. 🐻‍❄️task를 할당받은 스레드와 🦊task를 할당받은 스레드는 같을 수도, 다를 수도 있음)
    //그래도 한 작업이 끝나야 다음 작업이 시작되므로 대부분의 경우 동일한 스레드에서 순차적으로 실행되긴 함
    
    print("---------- Serial Queue ----------")
    
    queue.async {
        for item in 0...5 {
            print("\(item), 🐻‍❄️ on \(Thread.current)")
        }
    }
    
    queue.async {
        for item in 0...5 {
            print("\(item), 🦊 on \(Thread.current)")
        }
    }
    
    queue.async {
        for item in 0...5 {
            print("\(item), 🐤 on \(Thread.current)")
        }
    }
}

func concurrentQueue() {
    //concurrent이므로 serial과 달리 🐻‍❄️🦊🐤이 나오는 순서가 매 번 바뀜
    //serial과 마찬가지로 각 task를 할당받는 스레드는 🐻‍❄️🦊🐤 모두 같은 스레드를 할당받을 수도, 다른 스레드를 할당받을 수도 있음. 어떤 스레드를 할당할 지 결정하는 건 GCD의 영역!
    
    let queue = DispatchQueue(label: "Queue 5", attributes: .concurrent)
    
    print("---------- Concurrent Queue ----------")
    
    queue.async {
        for item in 0...5 {
            print("\(item), 🐻‍❄️ on \(Thread.current)")
        }
    }
    
    queue.async {
        for item in 0...5 {
            print("\(item), 🦊 on \(Thread.current)")
        }
    }
    
    queue.async {
        for item in 0...5 {
            print("\(item), 🐤 on \(Thread.current)")
        }
    }
}

func measureExecutionTime(of function: () -> Void) {
    let startTime = DispatchTime.now() // 시작 시간 기록
    function()                         // 함수 실행
    let endTime = DispatchTime.now()   // 끝 시간 기록
    
    let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    let milliseconds = Double(nanoseconds) / 1_000_000
    
    print("실행 시간: \(milliseconds) 밀리초")
}

func asyncExecutionTime() {
    let queue = DispatchQueue.global(qos: .default)
    
    queue.async {
        for _ in 1...1_000_000 {
            _ = 1 + 1
        }
    }
    
    queue.async {
        for _ in 1...1_000_000 {
            _ = 1 + 1
        }
    }
    
    queue.async {
        for _ in 1...1_000_000 {
            _ = 1 + 1
        }
    }
}

func syncExecutionTime() {
    let queue = DispatchQueue.global(qos: .default)
    
    queue.sync {
        for _ in 1...1_000_000 {
            _ = 1 + 1
        }
    }
    
    queue.sync {
        for _ in 1...1_000_000 {
            _ = 1 + 1
        }
    }
    
    queue.sync {
        for _ in 1...1_000_000 {
            _ = 1 + 1
        }
    }
}

func mainThread() {
    let queue = DispatchQueue.main
    let queue2 = DispatchQueue.global(qos: .userInteractive)
    
    queue.async {
        print("DispatchQueue.main is main thread: \(Thread.isMainThread)")
    }
    
    queue2.async {
        print("DispatchQueue.global(qos: .userInteractive) is main thread: \(Thread.isMainThread)") //false
        //global(qos: .userInteractive)는 사용자와의 상호작용을 위한 task나 거의 즉시 실행되어야 하는 task를 처리할 수 있음
        //하지만 main thread와는 엄연히 다르며 UI작업을 직접 수행할 수도 없음
    }
}

#Preview {
    ContentView()
}
