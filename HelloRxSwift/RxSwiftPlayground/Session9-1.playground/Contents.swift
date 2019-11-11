import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

let numbers = Observable.of(2, 3, 4)

// startWithはObservableの最初に流す要素（event）を指定できる
// スタート値の後に指定の要素が流れる（10の後に2がくる）
let observable =  numbers.startWith(10)
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

// 結果：10, 2, 3, 4
