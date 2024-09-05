//
//  ViewController.swift
//  7 Project
//
//  Created by 김동준 on 8/22/24.

import UIKit
import SnapKit

class ViewController: UIViewController { // 클래스의 이름은 뷰컨트롤이고 타입은 유아이뷰 컨트롤입니다.
    
    let button = UIButton()// 상수의 이름은 버튼이고 할당값은 유아이버튼의 객체 입니다.
    let titlelabel = UILabel() // 상수의 이름은 타이틀이고 할당값은 유아이레이블의 객체 입니다.
    let memotext = UITextView()// 상수의 이름은 모메노트이고 할당값은 유아이텍스트뷰의 객체 입니다.
    let textfield = UITextField()
    
    override func viewDidLoad() { // 함수의 이름은 뷰디드로드이고 빈파라미터의 반환타입은 없습니다.
        super.viewDidLoad()
        view.addSubview(button) // 뷰의 에디디서브뷰함수를 파라미터의 버튼을입력해서 호출합니다.
        view.addSubview(titlelabel)// 뷰의 에디디서브뷰함수를 파라미터의 타이틀입력해서 호출합니다.
        view.addSubview(textfield)
        view.addSubview(memotext) // 뷰의 에디디서브뷰함수를 파라미터의 메모텍스트입력해서 호출합니다.
        
        button.setTitle("완료", for: .normal) // 버튼의 setTitle 함수를 호출합니다.
        button.setTitleColor(UIColor.gray, for: .normal) // 버튼의 setTitleColor 함수를 호출합니다.
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 버튼의 타이틀레이블옵셔널의 폰트 할당값은 유아이폰트의 볼드시스템의 파라미터에 오프사이즈는 20 입니다.
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // 버튼의 에디디타켓힘수를 호출합니다.
        
        button.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().inset(25)
            make.width.equalTo(50)
            make.height.equalTo(50)
            
        }
        
        titlelabel.text = "메모" // 타이틀의 텍스트 할당값은 메모 입니다.
        titlelabel.textColor = UIColor.gray // 타이틀의 텍스트색깔 할당값은 유아아이색깔의 그레이입니다.
        titlelabel.font = UIFont.systemFont(ofSize: 20) // 타이틀의 폰트 할당값은 유아이폰트의 시스템폰트 파라미터안에 오프사이즈 20입니다.
        
        titlelabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(25)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        textfield.placeholder = "제목"
        textfield.textColor = UIColor.gray
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.backgroundColor = .white
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.borderWidth = 0.5
        
        textfield.snp.makeConstraints{ make in
            make.top.equalTo(titlelabel.snp.bottom).inset(-50)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        memotext.font = UIFont.systemFont(ofSize: 20) // 메모텍스트의 폰트 할당값은 유아이폰트의 시스템폰트 파라미터안에 오프사이즈 20입니다.
        memotext.textColor = UIColor.gray // 메모노트의 텍스트색깔 할당값은 유아색깔의 그레이입니다.
        memotext.textAlignment = .left // 메모노트의 textAlignment의 할당값의 왼쪽입니다.
        memotext.backgroundColor = UIColor.white // 메모노트의 backgroundColor의 할당값은 유아이색깔의 흰색입니다.
        memotext.layer.borderColor = UIColor.gray.cgColor
        memotext.layer.borderWidth = 0.5
        memotext.snp.makeConstraints{ make in
            make.top.equalTo(textfield.snp.bottom).inset(-50)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(400)
        }
    }
    @objc func buttonTapped() { // 오브젝트씨의 함수이름은 버튼탭이고 빈파라미터 반환타입은 없습니다.
        print(memotext.text)// 문장을 출력해서 파라미터의 메모텍스트의 텍스트가 있습니다.
        print(textfield.text)
    }
}
