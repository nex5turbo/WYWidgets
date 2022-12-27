//
//  CircularTextButton.swift
//  
//
//  Created by Wonyoung Jang on 2022/12/23.
//

import SwiftUI

public struct CircularTextButton: View {
    private var title: String
    private var action: () -> Void
    public init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    private var backgroundColor: Color = .clear
    private var tintColor: Color? = nil
    private var fontSize: CGFloat = 15
    private var textPadding: CGFloat? = nil
    private var strokeColor: Color = .clear
    private var strokeLineWidth: CGFloat = 1

    @State private var circleSize: CGFloat = 0

    public var body: some View {
        
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .strokeBorder(strokeColor, lineWidth: strokeLineWidth)
                    .background(backgroundColor)
                    .frame(width: circleSize, height: circleSize)

                Text(title)
                    .font(.system(size: fontSize))
                    .foregroundColor(tintColor)
                    .padding(.all, textPadding)
                    .overlay(
                        GeometryReader { proxy in
                            Color.clear
                                .onAppear {
                                    self.circleSize = max(proxy.size.height, proxy.size.width)
                                }
                                .onChange(of: proxy.size) { newValue in
                                    self.circleSize = max(proxy.size.height, proxy.size.width)
                                }
                        }
                    )
            }
            .clipShape(Circle())
            .clipped()
        }
    }
}

extension CircularTextButton {
    
    /// Set background color of CircularTextButton.
    /// - Parameter color: Color
    /// - Returns: View
    public func setBackgroundColor(_ color: Color) -> Self {
        var newView = self
        newView.backgroundColor = color
        return newView
    }
    
    /// Set text color of CircularTextButton.
    /// - Parameter color: Color
    /// - Returns: View
    public func tintColor(_ color: Color) -> Self {
        var newView = self
        newView.tintColor = color
        return newView
    }
    
    /// Set text padding of CircularTextButton.
    /// - Parameter value: CGFloat padding value
    /// - Returns: View
    public func textPadding(_ value: CGFloat) -> Self {
        var newView = self
        newView.textPadding = value
        return newView
    }
    
    /// Set stroke to CircularTextButton.
    /// - Parameters:
    ///   - color: Color stroke color
    ///   - lineWidth: CGFloat default = 1
    /// - Returns: View
    public func stroke(_ color: Color, lineWidth: CGFloat = 1) -> Self {
        var newView = self
        newView.strokeColor = color
        newView.strokeLineWidth = lineWidth
        return newView
    }
}
