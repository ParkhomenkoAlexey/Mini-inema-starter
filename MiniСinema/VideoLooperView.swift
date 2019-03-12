//
//  VideoLooperView.swift
//  MiniСinema
//
//  Created by Алексей Пархоменко on 11/03/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit
import AVFoundation

class VideoLooperView: UIView {
    let videos: [Video]
    let videoPlayerView = VideoPlayerView()
    
    init(videos: [Video]) {
        self.videos = videos
        
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
