import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

// 購読開始後に即時実行される
let relay = BehaviorRelay(value: ["Item 1"])
// 初期値を上書きする
//relay.accept(["Item 2"])
// 初期値と結合する
//relay.accept(relay.value + ["Item 2"])

// 初期値に値を保持する
var value = relay.value // この時点は初期値のみ
value.append("Item 2")
value.append("Item 3")
relay.accept(value)

relay.asObservable()
    .subscribe {
        print($0)
}
