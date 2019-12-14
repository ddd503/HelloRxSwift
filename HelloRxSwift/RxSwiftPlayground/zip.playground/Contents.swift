import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

let intSubject = PublishSubject<Int>()
let stringSubject = PublishSubject<String>()

// zipはobservableを結合して流せる。ただペアが揃っているイベントが全て流れてくるため、「１つのかたまりが完成したタイミングで何かしたい」時に使う。combineLatestとの違いは、ペアがいない場合は一番最近のものとペアにして流すのがcombineLatest、ペアがいない時はその値は流さないのがzip
_ = Observable
    .zip(intSubject, stringSubject) {
        "\($0) \($1)" }
    .subscribe(onNext: {
        print($0)
    })

intSubject.onNext(1)
intSubject.onNext(2)
stringSubject.onNext("A")
stringSubject.onNext("B")
stringSubject.onNext("C")
stringSubject.onNext("D")
intSubject.onNext(3)
intSubject.onNext(4)

/*
 結果
 1 A
 2 B
 3 C
 4 D
 */
