//
//  ContentView.swift
//  MemeMixer
//
//  Created by Pasindu Vihangana on 2024-10-20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var soundManager = SoundManager(soundFolderName: "MemeSounds")
    
    var body: some View {
        VStack {
            HStack {
                Text("MemeMixer")
                    .font(.largeTitle)
            }
            .padding()

            Spacer()

            // Use ScrollView to allow scrolling if tiles overflow
            ScrollView {
                // Use LazyVGrid for a responsive grid layout
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                    ForEach(soundManager.tiles.indices, id: \.self) { index in
                        let soundName = soundManager.tiles[index].sound
                        TileViewModel(tile: soundManager.tiles[index])
                            .onTapGesture {
                                soundManager.playSound(named: soundName)
                            }
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
