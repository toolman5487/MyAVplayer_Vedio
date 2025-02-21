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
    var player: AVPlayer?
    var playLayer: AVPlayerLayer?
    let videoURLString = "http://vjs.zencdn.net/v/oceans.mp4"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: videoURLString){
            print("url ok")
            player = AVPlayer(url: url)
            if let videoPlayer = player{
                playLayer = AVPlayerLayer(player: videoPlayer)
                playLayer?.frame = videoView.bounds
                playLayer?.videoGravity = .resizeAspectFill
                if let playLayer = playLayer{
                    videoView.layer.addSublayer(playLayer)
                }
                videoPlayer.play()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    // 如果需要確保 playerLayer 在 viewDidLayoutSubviews 中正確顯示
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playLayer?.frame = videoView.bounds
    }
    
}

