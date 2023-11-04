//
//  View+.swift
//
//
//  Created by Hoang Anh Tuan on 04/11/2023.
//

import SwiftUI

public extension View {
    func customBackButton(action: @escaping () -> Void) -> some View {
        navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        action()
                    } label: {
                        Image("back")
                            .tint(.white)
                    }
                }
            }
    }

    func screenBackground(with color: Color) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
    }
}

public struct DefaultListModifier: ViewModifier {
    public let inset: EdgeInsets
    public init(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) {
        inset = .init(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }

    public func body(content: Content) -> some View {
        content
            .listRowSeparator(.hidden)
            .listRowInsets(inset)
            .listRowBackground(Color.clear)
    }
}
