//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import SwiftUI

public protocol IDestination: Hashable { }

public final class Router: ObservableObject {
    
    @Published public var navPath = NavigationPath()
    
    public init() { }
    
    public func navigate(to destination: any IDestination) {
        navPath.append(destination)
    }
    
    public func navigateBack() {
        navPath.removeLast()
    }
    
    public func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
}
