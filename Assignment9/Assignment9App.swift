//
//  Assignment9App.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-18.
//

import SwiftUI

@main
struct Assignment9App: App {
    @StateObject private var showStore = ShowStore(favouriteShows: [])
    
    var body: some Scene {
        WindowGroup {
            TabView{
                Tab("TV Shows", systemImage: "tv"){
                    ContentView()
                }
                Tab("WatchList", systemImage: "star"){
                    WatchlistView(showStore: ShowStore.exampleShow)
                }.badge(showStore.favouriteShows.count)
                
            }.onAppear(){
                showStore.retrieveWatchlist()
            }
        }
    }
}



