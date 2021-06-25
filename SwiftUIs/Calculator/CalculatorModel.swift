//
//  CalculatorModel.swift
//  SwiftUIs
//
//  Created by Jovins on 2021/6/25.
//

import Foundation
import SwiftUI
import Combine

class CalculatorModel: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    var brain: CalculatorBrain = .left("0") {
        /// PassthroughSubject 提供了一个 send 方法，来通知外界驱动 UI 的数据将要发生改变，并刷新UI
        willSet { objectWillChange.send() }
    }
}
