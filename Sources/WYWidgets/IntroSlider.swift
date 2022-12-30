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
    
    public init(items: [IntroSliderItem]) {
        self.items = items
    }
    
    private var barItemSize: CGFloat?
    private var barColor: Color?
    private var barSelectedColor: Color?
    private var barAnimation: Animation?
    private var buttonTintColor: Color?
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
                                .font(.system(size: item.titleSize, weight: .bold))
                                .foregroundColor(item.titleColor)
                            Spacer()
                            if let contentImageName = item.contentImageName {
                                if let image = UIImage(named: contentImageName) {
                                    Image(uiImage: image)
                                } else {
#if DEBUG
                                    Text("Image error")
#endif
                                }
                            }
                            Text(item.content)
                                .font(.system(size: item.contentSize, weight: .semibold))
                                .foregroundColor(item.contentColor)
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
                .setButtonTintColor(buttonTintColor)
            }
        }
    }
}

extension IntroSlider {
    public func setButtonTintColor(_ color: Color?) -> Self {
        guard let color else { return self }
        var newView = self
        newView.buttonTintColor = color
        return newView
    }
}

public struct IntroSliderItem: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(background)
        hasher.combine(backgroundColor)
        hasher.combine(title)
        hasher.combine(content)
        hasher.combine(titleSize)
        hasher.combine(contentSize)
        hasher.combine(titleColor)
        hasher.combine(contentColor)
        hasher.combine(contentImageName)
    }
    /// nullable. If background set, backgroundColor ignored in View.
    public var background: UIImage?
    /// Background color property for IntroSlider.
    public var backgroundColor: Color
    /// Head title for IntroSlider.
    public var title: String
    /// Body content for IntroSlider.
    public var content: String

    public var titleColor: Color = .black
    public var contentColor: Color = .black
    public var titleSize: CGFloat = 30
    public var contentSize: CGFloat = 15
    public var contentImageName: String? = nil

    public init(background: UIImage? = nil, backgroundColor: Color, title: String, content: String) {
        self.background = background
        self.backgroundColor = backgroundColor
        self.title = title
        self.content = content
    }

    public func setTitleColor(_ color: Color) -> Self {
        var newItem = self
        newItem.titleColor = color
        return newItem
    }

    public func setContentColor(_ color: Color) -> Self {
        var newItem = self
        newItem.contentColor = color
        return newItem
    }

    public func setTitleSize(_ size: CGFloat) -> Self {
        var newItem = self
        newItem.titleSize = size
        return newItem
    }

    public func setContentSize(_ size: CGFloat) -> Self {
        var newItem = self
        newItem.contentSize = size
        return newItem
    }
    public func setContentImage(name: String) -> Self {
        var newItem = self
        newItem.contentImageName = name
        return newItem
    }
}
