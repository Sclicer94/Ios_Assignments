//
//  RowView.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-24.
//

import SwiftUI

struct RowView: View {
    var show: Show
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: show.artworkUrl100 ?? "tv"))
            VStack(alignment: .leading){
                Text(show.artistName)
                    .bold()
                Text(show.trackName)
                    .font(.caption)
                    .bold()
                Text(show.shortDescription)
                    .font(.caption2)
                    
            }
        }
        
        
    }
}

#Preview {
    RowView(show: Show.show)
}
