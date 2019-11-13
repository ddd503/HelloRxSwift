import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// takeWhile {} は中で指定した条件を満たすうちは購読を続け、満たさない要素がきた以降は購読しない
Observable.of(2, 4, 6, 7, 8, 10)
    .takeWhile { $0 % 2 == 0 }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
// 結果：2, 4, 6（7が満たさなかったから）
