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

	var activeSession: Session?

	@IBOutlet weak var titleLabel: UILabel!


	override func viewDidLoad() {
		super.viewDidLoad()

		playVideo()
	}

	func playVideo() {

		guard let absoluteURL = activeSession?.url?.absoluteString else {
			print("oh oh, we hebben geen url gekregen")
			return
		}

		titleLabel.text = activeSession?.title

		let videoURL = URL(string: absoluteURL)

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

}
