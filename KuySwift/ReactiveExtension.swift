//
//  ReactiveExtension.swift
//  KuySwift
//
//  Created by s.kananat on 2018/09/21.
//  Copyright © 2018 s.kananat. All rights reserved.
//

import Foundation
import Result
import ReactiveSwift

extension Signal {
    func ignoreError() -> Signal<Value, NoError> {
        return self.flatMapError { _ in .empty }
    }
}

extension SignalProducer {
    func ignoreError() -> SignalProducer<Value, NoError> {
        return self.flatMapError { _ in .empty }
    }
}
