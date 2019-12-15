import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

let input = PublishSubject<String>()

// materialize()はonErrorに来た場合も正常系(エラー発生としない)で受け取るようにできる
let result = input.materialize()

result.subscribe(
    onNext: { (event) in
        // 全て正常系として処理できる
        switch event {
        case .next(let text):
            print(text)
        case .error(let error):
            print("異常系にて終了：\(error)")
        case .completed:
            print("onNextでcompletedイベントを受け取って正常に処理完了") // onErrorをnextで受けても完了はnextではなくonCompletedに流れる
        }
},
    onError: { (error) in
        fatalError("ここには入ってこないはず")
},
    onCompleted: {
        print("onNext内のイベントが全て終了してから処理完了を受け取る")
})

input.onNext("テスト1")
//input.onError(NSError(domain: "", code: 999, userInfo: nil)) // ここを流すとonNext内でErrorで終了に入る
input.onNext("テスト2")
input.onCompleted()

/*
 エラーを流した場合
 テスト1
 異常系にて終了：Error Domain= Code=999 "(null)"
 onNext内のイベントが全て終了してから処理完了を受け取る

 エラーを流さない場合
 テスト1
 テスト2
 onNextでcompletedイベントを受け取って正常に処理完了
 onNext内のイベントが全て終了してから処理完了を受け取る
 */
