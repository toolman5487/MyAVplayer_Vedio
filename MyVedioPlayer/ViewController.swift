//
//  ViewController.swift
//  MyVedioPlayer
//
//  Created by Willy Hsu on 2025/2/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoView2: UIView!
    @IBOutlet weak var videoView3: UIView!
    
    var players: [AVPlayer?] = []  // 儲存每個播放器
    var playerLayers: [AVPlayerLayer?] = []  // 儲存每個AVPlayerLayer
    let videoURLs:[String] = ["http://vjs.zencdn.net/v/oceans.mp4",
                              "http://vjs.zencdn.net/v/oceans.mp4",
                              "http://vjs.zencdn.net/v/oceans.mp4",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        if let url = URL(string: videoURLString){
        //            print("url ok")
        //            player = AVPlayer(url: url)
        //            if let videoPlayer = player{
        //                playLayer = AVPlayerLayer(player: videoPlayer)
        //                playLayer?.frame = videoView.bounds
        //                playLayer?.videoGravity = .resizeAspectFill
        //                if let playLayer = playLayer{
        //                    videoView.layer.addSublayer(playLayer)
        //                }
        //                videoPlayer.play()
        //            }
        //        }
        // Do any additional setup after loading the view.
        for (index, urlString) in videoURLs.enumerated() {
            if let url = URL(string: urlString) {
                let player = AVPlayer(url: url)
                let playerLayer = AVPlayerLayer(player: player)
                switch index {
                case 0:
                    playerLayer.frame = videoView.bounds
                    videoView.layer.addSublayer(playerLayer)
                case 1:
                    playerLayer.frame = videoView2.bounds
                    videoView2.layer.addSublayer(playerLayer)
                case 2:
                    playerLayer.frame = videoView3.bounds
                    videoView3.layer.addSublayer(playerLayer)
                default:
                    break
                }
                
                playerLayer.videoGravity = .resizeAspectFill
                players.append(player)
                playerLayers.append(playerLayer)
                player.play()
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 確保每個 AVPlayerLayer 都正確填充對應的 videoView
        for (index, playerLayer) in playerLayers.enumerated() {
            switch index {
            case 0:
                playerLayer?.frame = videoView.bounds
            case 1:
                playerLayer?.frame = videoView2.bounds
            case 2:
                playerLayer?.frame = videoView3.bounds
            default:
                break
            }
        }
        //        playLayer?.frame = videoView.bounds
    }
    
}

