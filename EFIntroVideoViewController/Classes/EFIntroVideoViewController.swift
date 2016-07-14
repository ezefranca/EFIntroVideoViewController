//
//  EFIntroVideoViewController.swift
//  EFIntroVideoViewController
//
//  Created by techthings on 7/13/16.
//  Copyright © 2016 Ezequiel França. All rights reserved.
//

import UIKit
import AVFoundation

class EFIntroVideoViewController: UIViewController {
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer!
    var playerView: UIView!
    
    @IBInspectable var nextViewControllerIdentifier: String = ""
    @IBInspectable var storyboardName:String = "Main"
    @IBInspectable var videoPath:String = ""
    @IBInspectable var videoType:String = ""
    @IBInspectable var videoTime:Double = 5.0
    @IBInspectable var videoTransitionTime:Double = 1.0
    @IBInspectable var animated:Bool = false
    
    convenience init(videoPath:String, videoType:String, videoTime:Double, videoTransitionTime:Double, nextViewControllerIdentifier:String, animated:Bool) {
        self.init()
        self.videoPath = videoPath
        self.videoType = videoType
        self.videoTime = videoTime
        self.videoTransitionTime = videoTransitionTime
        self.nextViewControllerIdentifier = nextViewControllerIdentifier
        self.animated = animated
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()
    }
    
    private func loadVideo() {
        
        playerView = UIView(frame: view.bounds)
        
        view.addSubview(playerView)
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
        } catch {
            fatalError()
        }
        
        let path = NSBundle.mainBundle().pathForResource(videoPath, ofType:videoType)
        player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        playerView.layer.addSublayer(playerLayer)
        player?.seekToTime(kCMTimeZero)
        player?.play()
        NSTimer.scheduledTimerWithTimeInterval(videoTime, target: self, selector: #selector(openNextViewController), userInfo: nil, repeats: false)
    }
    
    func openNextViewController() {
        UIView.animateWithDuration(videoTransitionTime, animations: {
            self.playerView.alpha = 0
        }) { (completed) in
            let identifier = self.nextViewControllerIdentifier
            let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
            self.playerView.removeFromSuperview()
            let next = storyboard.instantiateViewControllerWithIdentifier(identifier)
            self.presentViewController(next, animated: self.animated, completion: nil)
        }
    }
}
