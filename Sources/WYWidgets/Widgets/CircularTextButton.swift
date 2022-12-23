//
//  CircularTextButton.swift
//  
//
//  Created by Wonyoung Jang on 2022/12/23.
//

import SwiftUI

struct CircularTextButton: View {
    var title: String = ""
    var action: () -> Void
    init(title: String = "", action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    private var backgroundColor: Color = .clear
    private var tintColor: Color? = nil
    private var fontSize: CGFloat = 15
    

    var body: some View {
        
        Button {
         
            action()
        } label: {

            ZStack {
                
                backgroundColor
                Text(title)
                    .font(.system(size: fontSize))
                    .foregroundColor(tintColor)
            }
            .contentShape(Circle())
        }
    }
}

extension CircularTextButton {

    func setBackgroundColor(_ color: Color) -> Self {
        var newView = self
        newView.backgroundColor = color
        return newView
    }

    func fontSize(_ fontSize: CGFloat) -> Self {
        var newView = self
        newView.fontSize = fontSize
        return newView
    }

    func tintColor(_ color: Color) -> Self {
        var newView = self
        newView.tintColor = color
        return newView
    }
}

struct CircularTextButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularTextButton { }
    }
}
