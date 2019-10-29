import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

/// takeUntil()は中に指定したsubjectが購読されるまで自身の購読を続ける（triggerが購読されたらsubjectの購読は止まる）
subject.takeUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subject.onNext("1")
subject.onNext("2")

trigger.onNext("X")

subject.onNext("3")

// 結果：1, 2
