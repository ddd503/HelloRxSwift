import UIKit
import RxSwift
import PlaygroundSupport

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

// ignoreElements()は流した値を全て無視する
strikes
    .ignoreElements()
    .subscribe { _ in
    print("[Subscription is Called]")
}.disposed(by: disposeBag)

strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

strikes.onCompleted()
