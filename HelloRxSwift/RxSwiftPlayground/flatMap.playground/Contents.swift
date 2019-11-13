import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

struct Student {
    var score: BehaviorRelay<Int>
}

let people1 = Student(score: BehaviorRelay(value: 75))
let people2 = Student(score: BehaviorRelay(value: 95))

let student = PublishSubject<Student>()

// flatMapとmap
student.asObservable()
    .flatMap { $0.score.asObservable() }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

// 購読開始（開始から判定イベントは流れる）
student.onNext(people1)
// 100点にした上で判定イベント
people1.score.accept(100)
// 購読開始（開始から判定イベントは流れる）
student.onNext(people2)

people2.score.accept(80)

people1.score.accept(50)
