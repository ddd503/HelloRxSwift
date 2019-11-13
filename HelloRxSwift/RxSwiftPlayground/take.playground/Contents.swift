import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// take()は指定した数だけ先にきた値を購読して、それ以降は無視する
Observable.of(1, 2, 3, 4, 5, 6)
    .take(3)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
// 結果：1, 2, 3（4以降は無視）
