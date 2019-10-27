//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by kawaharadai on 2019/10/23.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak private var applyFilterButton: UIButton!
    @IBOutlet weak private var photoImageView: UIImageView!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nc = segue.destination as? UINavigationController, let photosCVC = nc.topViewController as? PhotoCollectionViewController else {
            return
        }

        photosCVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            DispatchQueue.main.async {
                self?.updateImage(photo)
            }
        }).disposed(by: disposeBag)
    }

    @IBAction func didTapApplyFilter(_ sender: UIButton) {
        guard let inputImage = photoImageView.image else { return }
        FilterService().applyFileterObserve(to: inputImage).subscribe(onNext: { [weak self] filterImage in
            DispatchQueue.main.async {
                self?.updateImage(filterImage)
            }
        }).disposed(by: disposeBag)
    }

    private func updateImage(_ image: UIImage) {
        photoImageView.image = image
        applyFilterButton.isHidden = false
    }

}

