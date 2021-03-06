//
//  ContentView.swift
//  ImageLoader
//
//  Created by Kerem Karatal on 12/27/19.
//  Copyright © 2019 Kerem Karatal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var movieCollection: MovieCollection
    
    var movies: [Movie] {
        return movieCollection.fetchMovies()
    }
    
    var body: some View {
        NavigationView {
            MovieList(movies: movies)
            .navigationBarTitle("Popular Movies")
        }
    }
}

#if DEBUG
let deviceNames: [String] = [
    "iPhone SE",
    "iPhone 11"
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            ContentView(movieCollection: MovieCollection())
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName("Device: \(deviceName)")
        }
    }
}
#endif
