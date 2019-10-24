import UIKit
import RxSwift

_ = Observable.from([1, 2, 3, 4, 5])

let observable = Observable.just(1)

let observable2 = Observable.of(1, 2, 3)

let observable3 = Observable.of([1, 2, 3])

let observable4 = Observable.from([1, 2, 3, 4, 5])

// 順番に出力
observable4.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

// 配列ごと出力
observable3.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

// 非オプショナルで返り値がくる
observable4.subscribe(onNext: { element in
    print(element)
})
