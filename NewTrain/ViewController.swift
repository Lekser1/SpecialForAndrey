//
//  ViewController.swift
//  NewTrain
//
//  Created by Леонид Локтик on 05.09.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var slider = UISlider()
    var imageView = UIImageView()
    var playPauseButton = UIButton()
    let imageButtonPlay = UIImage(named: "play")
    let imageButtonPause = UIImage(named: "pause")
    let imageTrack = UIImage(named: "apple")
    let thumbImage = UIImage(named: "dot")
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlider()
        addImageTrack()
        addButton()
        
    }
    
    func addImageTrack() {
        imageView.image = imageTrack
        imageView.frame = CGRect(x: 0, y: 300, width: 100, height: 100)
        imageView.autoresizingMask = .flexibleWidth
        imageView.center.x = view.center.x
        view.addSubview(imageView)
        
    }
    
    func addSlider () {
        slider = UISlider(frame: CGRect(x: 0, y: 500, width: 250, height: 20))
        slider.center.x = view.center.x
        
        slider.setThumbImage(thumbImage, for: .highlighted)
        view.addSubview(slider)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "Don_Toliver", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
   
        
        slider.addTarget(self, action: #selector(changeTime), for: .valueChanged)
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(currentTime), userInfo: nil, repeats: true)
        
    }
    
    func addButton() {
        playPauseButton = UIButton(frame: CGRect(x: 0, y: 550, width: 30, height: 30))
        playPauseButton.setImage(imageButtonPlay, for: .normal)
        playPauseButton.addTarget(self, action: #selector(starStopMusic), for: .touchUpInside)
        playPauseButton.center.x = view.center.x
        view.addSubview(playPauseButton)
    }
    
    @objc func starStopMusic() {
        if player.isPlaying {
            player.stop()
            playPauseButton.setImage(imageButtonPlay, for: .normal)
        } else {
            player.play()
            playPauseButton.setImage(imageButtonPause, for: .normal)
            
        }
    }
    
    @objc func changeTime() {
        player.currentTime = TimeInterval(slider.value)
        player.play()
        playPauseButton.setImage(imageButtonPause, for: .normal)
    }
    
    @objc func currentTime() {
        slider.value = Float(player.currentTime)
    }

}

