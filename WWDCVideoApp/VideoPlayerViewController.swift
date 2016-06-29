//
//  VideoPlayerViewController.swift
//  WWDCVideoApp
//
//  Created by Wouter Steidl on 29/06/16.
//  Copyright © 2016 CocoaHeads. All rights reserved.
//

import UIKit
import MediaPlayer

class VideoPlayerViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		playVideo()
	}

	func playVideo() {

		let videoURL = URL(string: "http://devstreaming.apple.com/videos/wwdc/2014/403xxksrj0qs8c0/403/ref.mov")

		let player = AVPlayer(url: videoURL!)
		let playerLayer = AVPlayerLayer(player: player)
		playerLayer.frame = self.view.bounds
		self.view.layer.addSublayer(playerLayer)
		player.play()

	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
