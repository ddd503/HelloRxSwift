import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

// 登録時初期値なし
let left = PublishSubject<Int>()
let right = PublishSubject<Int>()
let center = PublishSubject<Int>()

// combineLatestは複数の購読対象を並列で処理できる（対象が全て購読されないと処理されない、left, right, centerどれも呼ばれないとダメ）
// 各対象にて最新の値が保持される
let observable = Observable.combineLatest(left, right, center, resultSelector: { lastLeft, lastRight, lastCenter in
    // resultSelectorで購読時の並列結果出力の形を指定している
    "\(lastLeft) \(lastRight) \(lastCenter)" // 例: 45 1 20
})

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

left.onNext(45)
right.onNext(1)
center.onNext(20)
left.onNext(30)
right.onNext(1)
right.onNext(2)
center.onNext(40)
/*
結果
 45 1 20
 30 1 20
 30 1 20
 30 2 20
 30 2 40
 */
