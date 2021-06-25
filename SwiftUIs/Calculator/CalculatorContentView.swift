//
//  CalculatorContentView.swift
//  SwiftUIs
//
//  Created by Jovins on 2021/6/24.
//

import SwiftUI

struct CalculatorContentView: View {
    
    let scale = UIScreen.main.bounds.width / 414
    @State
    private var brain: CalculatorBrain = .left("0")
    
    var body: some View {
        
        VStack(spacing: 12) {
            Spacer()
            Text(brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24 * scale)
                .lineLimit(1) // 限制一行
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            Button("Test") {
                self.brain = .left("1.232")
            }
            CalculatorButtonPad(brain: $brain)
                .padding(.bottom)
        }
    }
}

struct CalculatorButtonPad: View {
    
    @Binding
    var brain: CalculatorBrain
    let pads: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        
        VStack(spacing: 8) {
            ForEach(pads, id: \.self) { row in
                CalculatorButtonRow(brain: $brain, row: row)
            }
        }
    }
}

struct CalculatorButtonRow: View {
    
    @Binding
    var brain: CalculatorBrain
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    self.brain = self.brain.apply(item)
                }
            }
        }
    }
}

// MARK: - CalculatorButton
struct CalculatorButton: View {
    
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        })
    }
}

struct CalculatorContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorContentView().environment(\.colorScheme, .dark) // 适配dark mode
        // CalculatorContentView().previewDevice("iPhone SE") // 预览
        // CalculatorContentView().previewDevice("iPad Air 2")
    }
}


