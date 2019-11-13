import UIKit
import RxSwift

let disposeBag = DisposeBag()

Observable.of("A", "B", "C").subscribe {
    print($0)
}.disposed(by: disposeBag)

// create

Observable<String>.create { observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?")
    return Disposables.create()
}.subscribe(onNext: { print($0) }, onError: { print($0) }, onCompleted: { print("onCompleted")}, onDisposed: { print("onDisposed") }).disposed(by: disposeBag)
