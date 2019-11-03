import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// toArrayはイベントを１つの配列として扱う
Observable.of(1, 2, 3, 4, 5)
    .toArray().subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
// 結果：　[1, 2, 3, 4, 5]
