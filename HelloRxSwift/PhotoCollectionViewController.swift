//
//  PhotoCollectionViewController.swift
//  HelloRxSwift
//
//  Created by kawaharadai on 2019/10/26.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController {

    private var images = [PHAsset]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Storyboard側でCollectionViewとCellを繋げているためregisteはいらない
        poplatePhotos()
    }

    // MARK: Private

    private func poplatePhotos() {
        PHPhotoLibrary.requestAuthorization { [weak self] (status) in
            switch status {
            case .authorized:
                // 許可済み
                let assets = PHAsset.fetchAssets(with: .image, options: nil)
                assets.enumerateObjects { (asset, count, stop) in
                    self?.images.append(asset)
                }
                self?.images.reverse()
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .notDetermined, .denied:
                // 非許可
                print("非許可")
            default: break
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
    
        let asset = images[indexPath.row]
        let manager = PHImageManager.default()
        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil) { (image, _) in
            DispatchQueue.main.async {
                cell.setInfo(image: image)
            }
        }
        return cell
    }

    // MARK: UICollectionViewDelegate


}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
