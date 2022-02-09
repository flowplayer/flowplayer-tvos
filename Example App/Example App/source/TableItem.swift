//
//  TableItem.swift
//  flowplayer-tvOS
//
//  Created by Mehdi on 18. 11. 2021..
//

import Foundation
import Flowplayer

struct TableItem {
	let title: String
	let flowplayerMedia: FPFlowplayerMedia?
	let externalMedia: FPExternalMedia?
}

let tableData: [TableItem] = [
	.init(
		title: "HLS with VMAP",
		flowplayerMedia: nil,
		externalMedia: FPExternalMedia(mediaUrl: URL(string: Constants.DEMO_URL_HLS)!,
									   adSchedule: FPAdSchedule(adScheduleUrl: Constants.DEMO_URL_VMAP))
	),
	.init(
		title: "HLS with waterfall",
		flowplayerMedia: nil,
		externalMedia: FPExternalMedia(mediaUrl: URL(string: Constants.DEMO_URL_HLS)!,
									   adSchedule: FPAdSchedule(
										adScheduleWaterfall: [
											FPAdBreak(adTag: Constants.DEMO_URL_AD_PREROLL, roll: .pre),
											FPAdBreak(adTags: [Constants.DEMO_URL_AD_MIDROLL1, Constants.DEMO_URL_AD_MIDROLL2, Constants.DEMO_URL_AD_MIDROLL3], offset: 30),
											FPAdBreak(adTag: Constants.DEMO_URL_AD_POSTROLL, roll: .post)
										]),
									   subtitles: [])
	),
	.init(
		title: "MP4",
		flowplayerMedia: nil,
		externalMedia: FPExternalMedia(mediaUrl: URL(string: Constants.DEMO_URL_MP4)!)
	),
	.init(
		title: "HLS with embedded subtitles",
		flowplayerMedia: nil,
		externalMedia: FPExternalMedia(mediaUrl: URL(string: Constants.DEMO_URL_HLS_SUBTITLES)!)
	),
	.init(
		title: "Flowplayer media with sideloaded subs",
		flowplayerMedia: FPFlowplayerMedia(mediaId: Constants.DEMO_MEDIA_ID_SUBTITLES,
										   playerId: Constants.DEMO_PLAYER_ID),
		externalMedia: nil
	),
]
