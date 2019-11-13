import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

// concatは要素ごとを連結させてオブザーバブルを流せる
let first = Observable.of(1, 2, 3)
let second = Observable.of(4, 5, 6)

// オブザーバブルの配列を結合
let observable = Observable.concat([first, second])

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
// 結果：1, 2, 3, 4, 5, 6
