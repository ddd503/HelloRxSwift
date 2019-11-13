import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

let button = PublishSubject<Void>()
let textField = PublishSubject<String>()

// withLatestFromは呼ばれたら()内に指定した購読対象の最新の結果を購読処理する、最新がない場合は無視
let observable = button.withLatestFrom(textField)

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

textField.onNext("ddd")
textField.onNext("Swift")
textField.onNext("RxSwift")

// ボタンを押すと最新のtextFieldの値が流れるイメージ
button.onNext(())

// 結果：RxSwift
