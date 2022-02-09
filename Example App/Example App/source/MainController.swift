//
//  MainController.swift
//  flowplayer-tvOS
//
//  Created by Mehdi on 18. 11. 2021..
//

import AVKit
import Flowplayer

// - Identifiers
fileprivate let CELL_ID = "video-cell"

class MainController: UIViewController {
	
	// - Views
	@IBOutlet weak var tableView: UITableView!
	
	// - Props
	private var flowplayer: FPFlowplayer!
	private let player = AVPlayer()
	private let playerController = AVPlayerViewController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
		tableView.delegate = self
		
		playerController.player = player
		playerController.modalPresentationStyle = .fullScreen
		playerController.delegate = self
		flowplayer = FPFlowplayer(player: player, controller: playerController)
		flowplayer.delegate = self
	}
	
}

// MARK: - UITableViewDatasource
extension MainController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
		cell.textLabel?.text = tableData[indexPath.row].title
		cell.accessoryType = .disclosureIndicator
		return cell
	}
	
}

// MARK: - UITableViewDelegate
extension MainController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let item = tableData[indexPath.row]
		
		present(playerController, animated: true) { [weak self] in
			// INFO: For the ADs to load, media needs to be loaded after the controller has been presented
			self?.onPlayControllerPresented(item: item)
		}
	}
	
}

// MARK: - Private
extension MainController {
	
	private func onPlayControllerPresented(item: TableItem) {
		if let externalMedia = item.externalMedia {
			self.flowplayer.load(external: externalMedia, autoStart: true)
		}
		
		if let flowplayerMedia = item.flowplayerMedia {
			self.flowplayer.load(flowplayer: flowplayerMedia, autoStart: true)
		}
	}
	
}

// MARK: - AVPlayer
extension MainController: AVPlayerViewControllerDelegate {
	
	func playerViewControllerWillBeginDismissalTransition(_ playerViewController: AVPlayerViewController) {
		// Stop flowplayer playback
		flowplayer.stop()
	}
	
}

// MARK: - FPFlowplayerDelegate
extension MainController: FPFlowplayerDelegate {

	func onIdle(event: FPIdleEvent) {
		print(#function)
		print(event)
	}
	
	func onReady(event: FPReadyEvent) {
		print(#function)
		print(event)
	}
	
	func onPlay(event: FPPlayEvent) {
		print(#function)
		print(event)
	}
	
	func onPause(event: FPPauseEvent) {
		print(#function)
		print(event)
	}
	
	func onBuffer(event: FPBufferEvent) {
		print(#function)
		print(event)
	}
	
	func onComplete(event: FPCompleteEvent) {
		print(#function)
		print(event)
	}
	
	func onMute(event: FPMuteEvent) {
		print(#function)
		print(event)
	}
	
	func onVolume(event: FPVolumeEvent) {
		print(#function)
		print(event)
	}
	
	func onSpeed(event: FPSpeedEvent) {
		print(#function)
		print(event)
	}
	
	func onAudioTracksLoaded(event: FPAudioTracksEvent) {
		print(#function)
		print(event)
	}
	
	func onAudioTrackSelect(event: FPAudioTrackSelectEvent) {
		print(#function)
		print(event.audioTrack)
	}
	
	func onSubtitleTrackSelect(event: FPSubtitleTrackSelectEvent) {
		print(#function)
		dump(event.subtitleTrack)
	}
	
	func onSubtitleTracksLoaded(event: FPSubtitleTracksEvent) {
		print(#function)
		print(event)
	}
	
	func onOvpMetadata(event: FPOvpMetadataEvent) {
		print(#function)
		print(event)
	}
	
	func onError(event: FPErrorEvent) {
		print(#function)
		print(event)
	}
	
	func onAdBreakStart(event: FPAdBreakStartEvent) {
		print(#function)
		print(event)
	}
	
	func onAdBreakComplete(event: FPAdBreakCompleteEvent) {
		print(#function)
		print(event)
	}
	
	func onAdStart(event: FPAdStartEvent) {
		print(#function)
		print(event)
	}
	
	func onAdPause(event: FPAdPauseEvent) {
		print(#function)
		print(event)
	}
	
	func onAdResume(event: FPAdResumeEvent) {
		print(#function)
		print(event)
	}
	
	func onAdClick(event: FPAdClickEvent) {
		print(#function)
		print(event)
	}
	
	func onAdSkip(event: FPAdSkipEvent) {
		print(#function)
		print(event)
	}
	
	func onAdComplete(event: FPAdCompleteEvent) {
		print(#function)
		print(event)
	}
	
	func onAdError(event: FPAdErrorEvent) {
		print(#function)
		print(event)
	}
		
}
