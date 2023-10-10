//
//  CustomTabExtension.swift
//  Check-in
//
//  Created by dgsw8th32 on 2023/09/12.
//

import SwiftUI

@resultBuilder
struct CustomTabViewBuilder {
    static func buildBlock(_ components: CustomTabItem...) -> [CustomTabItem] {
        components
    }
}

extension View {
    func customTabItem(_ title: String, _ image: String, _ color: Color) -> CustomTabItem {
        CustomTabItem(title: title, image: image, color: color, content: AnyView(self))
    }
}
