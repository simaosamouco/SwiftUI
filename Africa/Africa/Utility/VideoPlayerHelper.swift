//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Simão Neves Samouco on 03/10/2023.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    if Bundle.main.url(forResource: fileName.lowercased(), withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName.lowercased(), withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
