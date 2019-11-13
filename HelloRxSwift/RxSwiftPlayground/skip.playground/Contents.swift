import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// skip()は指定した数字の分だけ前の要素を無視して購読する
Observable.of("A", "B", "C", "D", "E", "F")
    .skip(3)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
// 結果：D, E, F
