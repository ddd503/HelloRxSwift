import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

// skipUntil()は指定したオブジェクトが購読されるまで購読させない縛り(今回の$0はsubjectの方)
subject.skipUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subject.onNext("A")
subject.onNext("B")

trigger.onNext("X")

subject.onNext("C")

// 結果：C（A, Bは無視される）
