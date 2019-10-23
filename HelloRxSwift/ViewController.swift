//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by kawaharadai on 2019/10/23.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = Observable.from([1, 2, 3, 4, 5])
    }


}

