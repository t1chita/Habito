//
//  NavManager.swift
//  Habito
//
//  Created by Temur Chitashvili on 05.11.24.
//

import SwiftUI

final class NavigationManager: ObservableObject {
    public enum Destination: Codable, Hashable {
        case mainTabView
    }
    
    @Published var navPath = NavigationPath()
    
    // Function to navigate to a specific destination
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    // Function to navigate back
    func navigateBack() {
        navPath.removeLast()
    }
    
    // Function to navigate to the root
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
    func navigateBackWithSteps(_ steps: Int) {
        guard steps > 0 else { return }
        let countToRemove = min(steps, navPath.count)
        for _ in 0..<countToRemove {
            navPath.removeLast()
        }
    }
}
