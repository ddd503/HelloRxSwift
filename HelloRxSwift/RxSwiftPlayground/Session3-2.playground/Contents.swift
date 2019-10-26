import UIKit
import RxSwift

let disposeBag = DisposeBag()

// 購読開始前に仕込んでも購読される（ただし１つ分だけ）
let subject = BehaviorSubject(value: "Initial Value")
subject.onNext("Last Issue")
// 購読開始
subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 1")
