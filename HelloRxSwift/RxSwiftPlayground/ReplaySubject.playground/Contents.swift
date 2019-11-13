import UIKit
import RxSwift

let disposeBag = DisposeBag()

// 購読開始前は、bufferSizeに指定した数分だけ最新の値を購読する
let subject = ReplaySubject<String>.create(bufferSize: 2)
subject.onNext("Issue 1")
subject.onNext("Issue 2")
subject.onNext("Issue 3")
subject.onNext("Issue 4")
subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 5")
subject.onNext("Issue 6")

print("２回目の購読登録")

// 購読開始を行う度に内部で購読するeventが増えていく（7が２回呼ばれる）
subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 7")
