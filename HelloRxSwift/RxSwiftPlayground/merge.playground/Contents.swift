import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

// 登録時初期値なし
let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

// ２本の道（オブザーバブル）
let source = Observable.of(left.asObservable(),
                           right.asObservable())
// 一本にマージする（2本の道に入るイベントを統合する）
// mergeは複数の道を統合して、入ってくるイベントの受け口を統合する
let observable = source.merge()

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

left.onNext(5)
left.onNext(3)
right.onNext(2)
right.onNext(1)
left.onNext(99)

// 結果：5, 3, 2, 1, 99
