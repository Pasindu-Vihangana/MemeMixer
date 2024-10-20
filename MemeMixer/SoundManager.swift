//
//  SoundManager.swift
//  MemeMixer
//
//  Created by Pasindu Vihangana on 2024-10-20.
//

import Foundation
import SwiftUI
import AVFoundation

class SoundManager: ObservableObject {
    @Published var tiles: [Tile] = []
    private var audioPlayer: AVAudioPlayer?
    
    init(soundFolderName: String) {
        loadSounds(from: soundFolderName)
    }
    
    private func loadSounds(from folderName: String) {
        guard let soundFolderURL = Bundle.main.url(forResource: folderName, withExtension: nil) else {
            print("Sound folder not found: \(folderName)")
            return
        }
        
        do {
            let soundFiles = try FileManager.default.contentsOfDirectory(at: soundFolderURL, includingPropertiesForKeys: nil)
            for soundFile in soundFiles {
                if soundFile.pathExtension != "" {
                    let soundName = soundFile.deletingPathExtension().lastPathComponent
                    let soundColor = UIColor.random().cgColor
                    let soundFileName = "\(folderName)/\(soundName).\(soundFile.pathExtension)"
                    let tile = Tile(name: soundName, color: soundColor, sound: soundFileName)
                    tiles.append(tile)
                    // print(soundName)
                }
            }
        } catch {
            print("Error loading sounds: \(error.localizedDescription)")
        }
    }
    
    // Function to play sound
    func playSound(named soundName: String) {
        // Stop the previous sound if it's playing
        if audioPlayer?.isPlaying == true {
            audioPlayer?.stop()
        }
        
        guard let url = Bundle.main.url(forResource: soundName, withExtension: nil) else {
            print("Sound file not found: \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

extension UIColor {
    class func random() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        // print("r:\(red) g:\(green) b:\(blue)")
        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
    }
}
