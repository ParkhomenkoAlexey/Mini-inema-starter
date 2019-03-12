//
//  BigViewController.swift
//  MiniСinema
//
//  Created by Алексей Пархоменко on 11/03/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit

class BigViewController: UIViewController {

    let videos: [Video] = Video.localVideos()
    
    let videoPreviewLooper = VideoLooperView(videos: Video.localVideos())
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(videoPreviewLooper)
        setupCollectionView()
        
        videoPreviewLooper.frame = CGRect(x: view.bounds.width - 150 - 16, y: view.bounds.height - 100 - 16, width: 150, height: 100)
        videoPreviewLooper.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        
        // настраиваем величины отступов и размеров ячеек в collection view
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = Constants.galleryMinimumInteritemSpacing
        collectionView.contentInset = UIEdgeInsets(top: Constants.topDistanceToView, left: Constants.leftDistanceToView, bottom: Constants.bottomDistanceToView, right: Constants.rightDistanceToView)
        layout.itemSize = CGSize(width: Constants.galleryItemWidth , height: Constants.galleryItemHeight)
    }
}

extension BigViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cell.video = videos[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}


