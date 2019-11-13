import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// filterは順番に取り出して、処理を施す（map的に使う）
Observable.of(1, 2, 3, 4, 5, 6, 7)
    .filter { $0 % 2 == 0 }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
// 結果：2, 4, 6
