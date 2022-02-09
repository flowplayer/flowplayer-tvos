//
//  AppDelegate.swift
//  flowplayer-tvOS
//
//  Created by Mehdi on 18. 11. 2021..
//

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let audioSession = AVAudioSession.sharedInstance()
		
		do {
			// Required for audio & video playback on physical devices
			try audioSession.setCategory(.playback, mode: .moviePlayback)
		} catch {
			print("Setting category to AVAudioSessionCategoryPlayback failed.")
		}
		
		return true
	}
	
}

