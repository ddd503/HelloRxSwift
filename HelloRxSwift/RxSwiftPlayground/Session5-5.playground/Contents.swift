import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// skipWhile {} は中で指定した条件から外れるまでskipを繰り返し、外れて以降は全て購読する
Observable.of(2, 2, 3, 4, 4).skipWhile { $0 % 2 == 0 }.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
// 結果：3, 4, 5
