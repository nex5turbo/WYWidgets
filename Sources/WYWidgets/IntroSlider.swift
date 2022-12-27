//
//  IntroSlider.swift
//  
//
//  Created by Wonyoung Jang on 2022/12/27.
//

import SwiftUI

public struct IntroSlider: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var selectedIndex: Int = 0
    public var items: [IntroSliderItem]
    
    init(items: [IntroSliderItem]) {
        self.items = items
    }
    
    private var barItemSize: CGFloat?
    private var barColor: Color?
    private var barSelectedColor: Color?
    private var barAnimation: Animation?
    private var titleSize: CGFloat = 30
    private var contentSize: CGFloat = 15
    private var titleColor: Color?
    private var contentColor: Color?
    public var body: some View {
        ZStack {
            ForEach(items.indices, id: \.self) { index in
                if selectedIndex == index {
                    let item = items[index]
                    ZStack {
                        item.backgroundColor
                            .edgesIgnoringSafeArea(.all)
                        if let background = item.background {
                            Image(uiImage: background)
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                        }
                        VStack {
                            Text(item.title)
                                .font(.system(size: titleSize, weight: .bold))
                                .foregroundColor(titleColor)
                            Spacer()
                            Text(item.content)
                                .font(.system(size: contentSize, weight: .semibold))
                                .foregroundColor(contentColor)
                            Spacer()
                        }
                        .padding()
                    }
                    .transition(.identity)
                    .animation(.easeIn)
                }
            }

            VStack {
                Spacer()
                TabCountBar(tabCount: items.count, selectedIndex: $selectedIndex) {
                    presentationMode.wrappedValue.dismiss()
                }
                .setItemSize(barItemSize)
                .setBarColor(barColor)
                .setBarSelectedColor(barSelectedColor)
                .barAnimation(barAnimation)
            }
        }
    }
}

extension IntroSlider {
    public func setTitleTextSize(_ value: CGFloat) -> Self {
        var newView = self
        newView.titleSize = value
        return newView
    }
    public func setTitleTextColor(_ color: Color?) -> Self {
        var newView = self
        newView.titleColor = color
        return newView
    }
    public func setContentTextSize(_ value: CGFloat) -> Self {
        var newView = self
        newView.contentSize = value
        return newView
    }
    public func setContentTextColor(_ color: Color?) -> Self {
        var newView = self
        newView.contentColor = color
        return newView
    }
}

public struct IntroSliderItem: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(background)
        hasher.combine(backgroundColor)
        hasher.combine(title)
        hasher.combine(content)
    }
    /// nullable. If background set, backgroundColor ignored in View.
    public var background: UIImage?
    /// Background color property for IntroSlider.
    public var backgroundColor: Color
    /// Head title for IntroSlider.
    public var title: String
    /// Body content for IntroSlider.
    public var content: String
}
