//
//  FilterView.swift
//
//
//  Created by Hoang Anh Tuan on 04/11/2023.
//

import SwiftUI

enum FilterState: CaseIterable {
    case all
    case nameAscending
    case nameDescending
    case rating

    var title: String {
        switch self {
        case .all:
            return "All Movies"
        case .nameAscending:
            return "Name A-Z"
        case .nameDescending:
            return "Name Z-A"
        case .rating:
            return "Rating"
        }
    }
}

struct FilterView: View {
    @Binding var selection: FilterState
    @Binding var isShow: Bool

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Filter")
                    .foregroundColor(.white)

                Spacer()
                Button {
                    isShow = false
                } label: {
                    Image("close")
                }
            }
            .padding(.bottom, 16)

            ForEach(FilterState.allCases, id: \.self) { state in
                buildRow(state: state)
            }
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 0, trailing: 16))
        .background(Color.color4E89FF)
        .cornerRadius(12)
    }

    func buildRow(state: FilterState) -> some View {
        VStack {
            HStack {
                Text(state.title)
                    .font(selection == state ? .semibold16 : .regular16)
                    .foregroundColor(selection == state ? .color04EECD : .white)

                Spacer()

                if selection == state {
                    Image("checkmark")
                        .frame(width: 24, height: 24)
                }
            }

            Spacer()
                .frame(height: 20)

            Spacer()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1)
                .background(Color.white)
        }
        .padding(.bottom, 16)
        .onTapGesture {
            if selection == state { return }

            selection = state
            isShow = false
        }
    }
}
