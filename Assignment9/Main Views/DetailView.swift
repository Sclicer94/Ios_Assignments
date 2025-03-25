//
//  DetailView.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-24.
//

import SwiftUI


struct DetailView: View {
    var show: Show
    
    var body: some View {
        ZStack {
            Color("detailBG")
                .ignoresSafeArea()
            ScrollView {
                VStack{
                    ZStack(alignment: .topLeading){
                        
                        VStack(alignment: .leading){
                            ZStack {
                                Color("detailIBG")
                                AsyncImage(url: URL(string: show.artworkUrl100))
                                    .frame(maxWidth: .infinity, maxHeight: 300)
                                    .scaledToFill()
                            }
                            
                            HStack {
                                Text(show.trackName)
                                    .bold()
                                    .font(.title)
                            }
                            if (show.trackExplicitness == "Explicit") {
                                Image(systemName: "18.circle")
                            } else if (show.trackExplicitness == "notExplicit") {
                                Image(systemName: "figure.and.child.holdinghands")
                            }
                            
                            Text(show.longDescription)
                                .font(.caption)
                                .fontWeight(.black)
                            
                        }.padding()
                    }
                    
                    
                    Divider()
                    
                    NavigationLink(destination: WebView(webText: show.collectionViewUrl)){
                        Label("More Information", systemImage: "tv")
                    }
                    
                    
                    
                }.padding()
                //                .navigationTitle("\(campsite.name)")
                Spacer()
            }
        }
       
    }
}

#Preview {
    DetailView(show: Show.show)
}
