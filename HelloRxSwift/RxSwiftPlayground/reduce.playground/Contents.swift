import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

let source = Observable.of(1, 2, 3)

// reduceは初期値から順番に処理を回す
source.reduce(0, accumulator: +) // 要素を全部足していく
    .subscribe(onNext: {
        // 足算の結果が流れてくる
        print($0)
    }).disposed(by: disposeBag)

// やってることは上と同じだが、ロジックを挟めるようにした版（足す前にみれる）
source.reduce(0, accumulator: { summary, newValue in
    // 今の蓄積値と次の要素が流れてくるので足して返す
    return summary + newValue
}).subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
