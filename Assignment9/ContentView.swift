//
//  ContentView.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-18.
//


//This is a single view applications.  Your main screen will have a search bar and this will populate a list of television shows that are returned from the search.
//The list will contain:
//the shows name
//the episode name
//a truncated description
//display the provided episode image.
//The main screen will include a title of your name and shows - for example "Ed's Shows"
//When you click on a row it will take you to a details page which will include the following:
//The episode title
//An image
//The show name
//the full episode description
//An image that represents whether the show is explicit or not
//A link that will display additional web details - this comes from the trackViewUrl
//And any other information that you want to include from the API

import SwiftUI

struct ContentView: View {
    
    let shows = Bundle.main.decode("rickAndMorty.json")
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
