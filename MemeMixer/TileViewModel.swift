//
//  TileViewModel.swift
//  MemeMixer
//
//  Created by Pasindu Vihangana on 2024-10-20.
//

import SwiftUI

// Tile ViewModel
struct Tile: Identifiable {
    let id = UUID()
    var name: String
    var color: CGColor
    var sound: String
}

struct TileViewModel: View {
    var tile: Tile

    var body: some View {
        VStack {
            Text(tile.name)
                .font(.headline)
                .padding(.horizontal)
            // You can add more UI elements here
        }
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(Color(tile.color))
        .cornerRadius(10)
//        .onTapGesture {
//            soundManager.playSound(named: tile.sound)
//        }
    }
}

#Preview {
    let newTile = Tile(name: "Tile 1", color: UIColor.random().cgColor, sound: "Sad Violin.mp3")
    TileViewModel(tile: newTile)
}
