//
//  RoundedTextButton.swift
//
//
//  Created by 워뇨옹 on 9/9/24.
//

import SwiftUI

struct RoundedTextButton: View {
    enum RoundedTextButtonScale {
        /// fit would fit button width to content(text and caption) width
        case fit
        /// fill would fill button width to parent view width. Set padding false if you dont't want extra space between button and parent view. Default true
        case fill(padding: Bool = true)
    }
    private let text: String
    private let caption: String
    private let action: () -> Void
    
    private var alignment: HorizontalAlignment = .center
    
    private var backgroundColor: Color = .blue
    private var fontColor: Color = .white
    private var captionColor: Color = .gray
    
    private var scale: RoundedTextButtonScale = .fit
    private var font: Font = .headline
    private var captionFont: Font = .caption
    
    private var cornerRadius: CGFloat = 10
    
    init(_ text: String, caption: String = "", action: @escaping () -> Void) {
        self.text = text
        self.caption = caption
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            buttonLabel()
        }
    }
    
    @ViewBuilder func buttonLabel() -> some View {
        switch scale {
        case .fit:
            buttonLabelContent()
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        case .fill(let padding):
            if padding {
                buttonLabelContent()
                    .frame(maxWidth: .infinity)
                    .background(backgroundColor)
                    .cornerRadius(cornerRadius)
                    .padding(.horizontal)
            } else {
                buttonLabelContent()
                    .frame(maxWidth: .infinity)
                    .background(backgroundColor)
                    .cornerRadius(cornerRadius)
            }
            
        }
    }
    
    @ViewBuilder func buttonLabelContent() -> some View {
        VStack(alignment: alignment) {
            Text(text)
                .font(font)
                .foregroundColor(fontColor)
            if caption != "" {
                Text(caption)
                    .font(captionFont)
                    .foregroundColor(captionColor)
            }
        }
        .padding()
    }
}

extension RoundedTextButton {
    public func scaleMode(_ value: RoundedTextButtonScale) -> Self {
        var view = self
        view.scale = value
        
        return view
    }
    
    public func font(_ font: Font) -> Self {
        var view = self
        view.font = font
        
        return view
    }
    
    public func captionFont(_ font: Font) -> Self {
        var view = self
        view.captionFont = font
        
        return view
    }
    
    public func radius(_ value: CGFloat) -> Self {
        var view = self
        view.cornerRadius = value
        
        return view
    }
    
    public func textAlignment(_ alignment: HorizontalAlignment) -> Self {
        var view = self
        view.alignment = alignment
        
        return view
    }
    
    public func backgroundColor(_ color: Color) -> Self {
        var view = self
        view.backgroundColor = color
        
        return view
    }
    public func fontColor(_ color: Color) -> Self {
        var view = self
        view.fontColor = color
        
        return view
    }
    public func captionColor(_ color: Color) -> Self {
        var view = self
        view.captionColor = color
        
        return view
    }
}

#Preview {
    RoundedTextButton("Test Text", caption: "Hello world") {
        print("Button Tapped")
    }
    .scaleMode(.fill())
    .radius(30)
}
