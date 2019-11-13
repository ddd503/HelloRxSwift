import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// mapはイベント全てに共通の処理を施す
Observable.of(1, 2, 3, 4, 5)
    .map {
        return $0 * 2
   }.subscribe(onNext: {
        print($0)
   }).disposed(by: disposeBag)
// 結果：2, 4, 6, 8, 10
