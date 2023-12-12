//
//  File.swift
//  
//
//  Created by Kevin on 12/10/23.
//

import Foundation

public enum MockNavigateDestination: Hashable {
    case navigateOne
    case navigateTwo
}

enum MockPresenter: Identifiable {
    var id: String {
        switch self {
        case .showError:
            return "showError"
        }
    }

    case showError

}
