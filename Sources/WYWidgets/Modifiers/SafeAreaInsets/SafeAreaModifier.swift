//
//  SafeAreaModifier.swift
//
//
//  Created by 워뇨옹 on 9/9/24.
//

import Foundation
import SwiftUI

struct SafeAreaModifier: ViewModifier {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    func body(content: Content) -> some View {
        content
            .padding(.top, safeAreaInsets.top)
            .padding(.bottom, safeAreaInsets.bottom)
    }
}

extension View {
    func safeAreaPadding() -> some View {
        modifier(SafeAreaModifier())
    }
}
