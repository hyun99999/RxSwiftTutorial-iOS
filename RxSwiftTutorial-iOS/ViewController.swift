//
//  ViewController.swift
//  RxSwiftTutorial-iOS
//
//  Created by kimhyungyu on 2021/01/21.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var completeBtn: UIButton!
    @IBOutlet weak var secondLabel: UILabel!
    
    //MARK: - disposeBag
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBindUI()
    }
    // MARK: - 유효성 검사 Rx 바인딩
    func setupBindUI(){
        firstTextField.rx.text.orEmpty
            .map(checkValidate1)
            .subscribe(onNext: {value in
                print(value)
                self.firstLabel.isHidden = value
            })
            .disposed(by: disposeBag)
        
        secondTextField.rx.text.orEmpty
            .map(checkValidate2)
            .subscribe(onNext: {value in
                print(value)
                self.secondLabel.isHidden = value
            })
            .disposed(by: disposeBag)
        //둘다 충족.
        Observable.combineLatest(firstTextField.rx.text.orEmpty.map(checkValidate1), secondTextField.rx.text.orEmpty.map(checkValidate2),
            resultSelector: { value1,value2 in value1 && value2}
            )
        .subscribe(onNext: {value in
            self.completeBtn.isEnabled = value
        })
        .disposed(by: disposeBag)
    }
    // 완료버튼 함수
    @IBAction func btnConfirmclicked(_ sender: UIButton) {
        print("confrim")
    }
    //textField 유효성 검사 함수
    func checkValidate1(_ item: String)-> Bool {
        return item.count > 5
    }
    func checkValidate2(_ item: String)-> Bool {
        return item.count > 8
    }
}


