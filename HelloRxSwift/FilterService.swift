//
//  FilterService.swift
//  HelloRxSwift
//
//  Created by kawaharadai on 2019/10/28.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import Foundation
import UIKit
import CoreImage
import RxSwift

class FilterService {

    private var context: CIContext

    init() {
        context = CIContext()
    }

    func applyFileterObserve(to inputImage: UIImage) -> Observable<UIImage> {
        return Observable<UIImage>.create { observer in
            self.applyFileter(to: inputImage) { image in
                observer.onNext(image)
            }

            return Disposables.create()
        }
    }

    private func applyFileter(to inputImage: UIImage, completion: (UIImage) -> ()) {
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(5.0, forKey: kCIInputWidthKey)

        if let sourceImage = CIImage(image: inputImage) {
            filter.setValue(sourceImage, forKey: kCIInputImageKey)
            if let cgImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
                let processedImage = UIImage(cgImage: cgImage, scale: inputImage.scale, orientation: inputImage.imageOrientation)
                completion(processedImage)
            }
        }
    }
}
