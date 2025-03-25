//
//  Assignment9App.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-18.
//

import SwiftUI

@main
struct Assignment9App: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                Tab("TV Shows", systemImage: "tv"){
                    ContentView()
                }
                Tab("Main Screen", systemImage: "person"){
                    MainView()
                }
            }
        }
    }
}



