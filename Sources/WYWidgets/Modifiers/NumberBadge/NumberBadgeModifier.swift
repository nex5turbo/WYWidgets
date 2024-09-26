//
//  SwiftUIView.swift
//
//
//  Created by 워뇨옹 on 9/26/24.
//

import SwiftUI

struct NumberBadgeModifier: ViewModifier {
    let number: Int
    @State var foreground: Color = .white
    @State var background: Color = .red
    
    private let size = 16.0
    private let x = 20.0
    private let y = -8.0
    // showing more than 99 might take too much space, rather display something like 99+
    func hasTwoOrLessDigits() -> Bool {
        return number < 100
    }
    
    func widthMultplier() -> Double {
        if number < 10 {
            // one digit
            return 1.0
        } else if number < 100 {
            // two digits
            return 1.5
        } else {
            // too many digits, showing 99+
            return 2.0
        }
    }
    
    @State private var textSize: CGSize = .zero
    func body(content: Content) -> some View {
        content
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        ZStack {
                            Capsule()
                                .fill(background)
                                .frame(width: size * widthMultplier(), height: size, alignment: .topTrailing)
                                .offset(x: x, y: y)
                            
                            if hasTwoOrLessDigits() {
                                Text("\(number)")
                                    .foregroundColor(foreground)
                                    .font(Font.caption)
                                    .offset(x: x, y: y)
                            } else {
                                Text("99+")
                                    .foregroundColor(foreground)
                                    .font(Font.caption)
                                    .frame(width: size * widthMultplier(), height: size, alignment: .center)
                                    .offset(x: x, y: y)
                            }
                        }
                        .opacity(number == 0 ? 0 : 1)
                    }
                    Spacer()
                }
            }
    }
}

extension View {
    func numberBadge(number: Int) -> some View {
        modifier(NumberBadgeModifier(number: number))
    }
}

#Preview {
    Text("Number Badge Test")
        .numberBadge(number: 10)
}
