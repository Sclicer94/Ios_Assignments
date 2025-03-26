//
//  MainView.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-24.
//

import SwiftUI

struct WatchlistView: View {
    @ObservedObject var showStore: ShowStore
    
    var body: some View {
        Text("My Watchlist")
        //TODO: - LOAD FAVOURITES
        List{
            ForEach(showStore.favouriteShows){ show in
                RowView(show: show)
            }.onDelete { indexSet in
                showStore.removeFromWatchlist(forIndexSet: indexSet)
            }
        }
    }
}

#Preview {
    WatchlistView(showStore: ShowStore.exampleShow)
}
