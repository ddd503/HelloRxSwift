import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

let source = Observable.of(1, 2, 3, 4, 5, 6)

// 全要素に対して同一に処理を施す場合はscanで良い、ロジックを挟みたい場合はreduceを使う
source.scan(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
