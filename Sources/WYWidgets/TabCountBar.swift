//
//  TabCountBar.swift
//  
//
//  Created by Wonyoung Jang on 2022/12/27.
//

import SwiftUI

public struct TabCountBar: View {
    var tabCount: Int
    @Binding var selectedIndex: Int
    var doneTap: () -> Void

    init(tabCount: Int, selectedIndex: Binding<Int>, done: @escaping () -> Void) {
        self.tabCount = tabCount
        self._selectedIndex = selectedIndex
        self.doneTap = done
    }

    private var barItemSize: CGFloat = 10
    private var barColor: Color = .gray
    private var barSelectedColor: Color = .black
    private var animation: Animation = .default
    private var buttonTintColor: Color? = nil

    private var prevText = "Prev"
    private var nextText = "Next"
    private var doneText = "Done"

    private var isEndOfTabs: Bool {
        selectedIndex == tabCount - 1
    }
    private var isStartOfTabs: Bool {
        selectedIndex == 0
    }

    public var body: some View {
        HStack {
            Button {
                selectedIndex -= 1
            } label: {
                Text(prevText)
                    .foregroundColor(buttonTintColor)
            }
            .disabled(isStartOfTabs)
            
            Spacer()
            
            ForEach(0..<tabCount, id: \.self) { index in
                Circle()
                    .frame(width: barItemSize, height: barItemSize)
                    .foregroundColor(index == selectedIndex ? barSelectedColor : barColor)
                    .animation(animation, value: barColor)
                    .animation(animation, value: barSelectedColor)
            }
            Spacer()
            Button {
                if isEndOfTabs {
                    doneTap()
                } else {
                    selectedIndex += 1
                }
            } label: {
                Text(isEndOfTabs ? doneText : nextText)
                    .foregroundColor(buttonTintColor)
            }
        }
        .padding()
    }
}

extension TabCountBar {
    public func nextButtonText(_ value: String) -> Self {
        var newView = self
        newView.nextText = value
        return newView
    }

    public func prevButtonText(_ value: String) -> Self {
        var newView = self
        newView.prevText = value
        return newView
    }

    public func doneButtonText(_ value: String) -> Self {
        var newView = self
        newView.doneText = value
        return newView
    }

    public func setItemSize(_ value: CGFloat?) -> Self {
        guard let value else { return self }
        var newView = self
        newView.barItemSize = value
        return newView
    }

    public func setBarColor(_ color: Color?) -> Self {
        guard let color else { return self }
        var newView = self
        newView.barColor = color
        return newView
    }

    public func setBarSelectedColor(_ color: Color?) -> Self {
        guard let color else { return self }
        var newView = self
        newView.barSelectedColor = color
        return newView
    }

    public func barAnimation(_ animation: Animation?) -> Self {
        guard let animation else { return self }
        var newView = self
        newView.animation = animation
        return newView
    }

    public func setButtonTintColor(_ color: Color?) -> Self {
        guard let color else { return self }
        var newView = self
        newView.buttonTintColor = color
        return newView
    }
}
