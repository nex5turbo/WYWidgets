//
//  StickyScrollView.swift
//
//
//  Created by 워뇨옹 on 9/10/24.
//

import SwiftUI

struct StickyScrollView<Content: View, Header: View>: View {
    @State private var offsetY: CGFloat = 0
    @State private var initialOffsetY: CGFloat = 0
    
    let content: () -> Content
    let header: () -> Header
    
    init(minHeaderHeight: CGFloat = 350, content: @escaping () -> Content, header: @escaping () -> Header) {
        self.content = content
        self.header = header
        self.minHeaderHeight = minHeaderHeight
    }
    
    private var minHeaderHeight: CGFloat
    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { geometry in
                    let offset = geometry.frame(in: .global).origin.y
                    Color.clear.frame(width: 1, height: 0)
                        .onAppear {
                            self.initialOffsetY = offset
                        }
                        .onChange(of: geometry.frame(in: .global).origin.y, perform: { value in
                            self.offsetY = value
                        })
                    header()
                        .frame(
                            width: geometry.size.width,
                            height: minHeaderHeight + (offset > 0 ? offset : 0)
                        )
                        .offset(y: (offset > 0 ? -offset : 0))
                }
                .frame(minHeight: minHeaderHeight)
                content()
            }
        }
    }
}

#Preview {
    StickyScrollView {
        VStack {
            ForEach(0...100, id:\.self) { index in
                Text("Many components")
            }
        }
    } header: {
        Image(systemName: "heart.fill")
            .resizable()
            .scaledToFill()
    }

}
