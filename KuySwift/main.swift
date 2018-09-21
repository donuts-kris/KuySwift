//
//  main.swift
//  KuySwift
//
//  Created by s.kananat on 2018/09/21.
//  Copyright © 2018 s.kananat. All rights reserved.
//

import Foundation
import Result
import ReactiveSwift

print("Hello, World!")

let (signal, observer) = Signal<Int, NSError>.pipe()

signal.observe { event in
    switch event {
    case let .value(value):
        print("signal1 \(value)")
    case let .failed(error):
        print("signal1 error")
    case .completed:
        print("signal1 completed")
    case .interrupted:
        print("signal1 interrupted")
    }
}

let signal2 = signal.ignoreError()

signal2.observe { event in
    switch event {
    case let .value(value):
        print("signal2 \(value)")
    case let .failed(error):
        print("signal2 error")
    case .completed:
        print("signal2 completed")
    case .interrupted:
        print("signal2 interrupted")
    }
}

observer.send(value: 1)
observer.send(error: NSError())
observer.send(value: 2)
observer.send(value: 3)
observer.send(value: 4)
