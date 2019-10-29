import UIKit
import RxSwift
import PlaygroundSupport

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

// elementAt()は指定した値以上のeventが流れた時に初めて購読する
// 結果： Xが１つだけ出力される
strikes.elementAt(2)
    .subscribe(onNext: { text in
        print(text)
    }).disposed(by: disposeBag)

strikes.onNext("X")
strikes.onNext("X")
strikes.onNext("X")
