//
//  Show.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-18.
//

import Foundation

struct Shows: Codable {
    var results: [Show] = []
}

class Show: Codable, Hashable, Identifiable {

        static var show = Show(
            trackId: 756852895,
            artistName: "Rick and Morty",
            trackName: "Pilot",
            shortDescription: "Rick moves in with his daughter's family and establishes himself as a bad influence on his grandson",
            longDescription: "Rick moves in with his daughter's family and establishes himself as a bad influence on his grandson, Morty.",
            artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video113/v4/74/30/fd/7430fd41-956d-349f-fa2e-3e627623b6dd/pr_source.png/100x100bb.jpg",
            collectionViewUrl: "https://itunes.apple.com/us/tv-season/pilot/id741096885?i=756852895&uo=4",
            trackExplicitness: "notExplicit"
        )
        
        static func == (lhs: Show, rhs: Show) -> Bool {
            lhs.trackId == rhs.trackId
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(trackId)
        }
        
        var trackId: Int
        var artistName: String
        var trackName: String
        var shortDescription: String
        var longDescription: String
        var artworkUrl100: String
        var collectionViewUrl: String?
        var trackExplicitness: String

        init(trackId: Int, artistName: String, trackName: String, shortDescription: String, longDescription: String, artworkUrl100: String, collectionViewUrl: String? = nil, trackExplicitness: String) {
            self.trackId = trackId
            self.artistName = artistName
            self.trackName = trackName
            self.shortDescription = shortDescription
            self.longDescription = longDescription
            self.artworkUrl100 = artworkUrl100
            self.collectionViewUrl = collectionViewUrl
            self.trackExplicitness = trackExplicitness
        }
    }

extension Bundle {
    func decode(_ file: String) -> [Show] {

        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Can't find a file with this name")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Can't convert to data")
        }

        guard let shows = try? JSONDecoder().decode(Shows.self, from: data) else {
            fatalError("Can't decode the json")
        }

        return shows.results
    }
}
