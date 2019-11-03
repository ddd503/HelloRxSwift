import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

struct Student {
    var score: BehaviorRelay<Int>
}

let people1 = Student(score: BehaviorRelay(value: 20))
let people2 = Student(score: BehaviorRelay(value: 40))
let people3 = Student(score: BehaviorRelay(value: 30))

let student = PublishSubject<Student>()

// flatMapLatestは購読後、別のオブザーバーに参照されたら、元の購読対象は外れる（同時購読対象は1つだけ）
student.asObservable()
    .flatMapLatest { $0.score.asObservable() }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

// 購読開始（開始から判定イベントは流れる）
student.onNext(people1)
student.onNext(people2) // people1の購読は外れる
student.onNext(people3) // people2の購読は外れる
// 以降は出力されない
people1.score.accept(50)
people2.score.accept(40)
people1.score.accept(55)
// 結果：20, 40, 30
