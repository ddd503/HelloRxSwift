import UIKit
import RxSwift

let disposeBag = DisposeBag()

let variable = Variable("Initial Value")
//variable.value = "Hello World"

// appendだと文字列自体を結合する
variable.value.append("Item 1")
variable.value.append("Item 2")
variable.asObservable().subscribe {
    print($0)
}

// 購読開始後も関係なく結合
variable.value.append("Item 3")
