import UIKit
import RxSwift

let disposeBag = DisposeBag()

// 購読開始前に仕込んだものは購読されない
let subject = PublishSubject<String>()
subject.onNext("Issue 1")
subject.subscribe { event in
    print(event)
}
subject.onNext("Issue 2")
subject.onNext("Issue 3")
//subject.dispose() // 廃棄
subject.onCompleted() // 完了
subject.onNext("Issue 4")
