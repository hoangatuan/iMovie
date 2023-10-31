//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import SwiftUI

public class AnyIdentifiable: Identifiable {
    public let destination: any Identifiable

    public init(destination: any Identifiable) {
        self.destination = destination
    }
}

public final class Router: ObservableObject {
    @Published public var navPath = NavigationPath()
    @Published public var presentedSheet: AnyIdentifiable?

    public init() {}

    public func presentSheet(destination: any Identifiable) {
        presentedSheet = AnyIdentifiable(destination: destination)
    }

    public func navigate(to destination: any Hashable) {
        navPath.append(destination)
    }

    public func navigateBack() {
        navPath.removeLast()
    }

    public func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
