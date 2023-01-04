//
//  AwiseApp.swift
//  Awise
//
//  Created by liu zhenke on 10/2/22.
//

import SwiftUI
import UIKit

@main
struct AwiseApp: App {
    @AppStorage("isDark") private var isDark = false //added by Jerry
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(isDark ? .dark : .light)
                .accentColor(.primary)
        }
    }
}
