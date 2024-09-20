//
//  ViewController.swift
//  7 Project
//
//  Created by 김동준 on 8/22/24.

//
//  ViewController.swift
//  7 Project
//
//  Created by 김동준 on 8/22/24.

import UIKit
import SnapKit
import CoreData

class ViewController: UIViewController {
    
    let button = UIButton()
    let titlelabel = UILabel()
    let memotext = UITextView()
    let textfield = UITextField()
    let coreDataManager = CoreDataManager()
    var onDismiss: (() -> Void)?
    var ischange : Bool = false
    var entity: Entity? // 수정할 메모.
    // 만약에 entity 변수가 nil이 아니면 안에있는 name값은 제목에 textfield에 memo값은 textview에 나오게 해주세요.
    
    override func viewDidLoad() { // 함수의 이름은 뷰디드로드이고 빈파라미터의 반환타입은 없습니다.
        super.viewDidLoad()
        //                updateNavigationBarButton()
        
        
        view.addSubview(button) // 뷰의 에디디서브뷰함수를 파라미터의 버튼을입력해서 호출합니다.
        view.addSubview(titlelabel)// 뷰의 에디디서브뷰함수를 파라미터의 타이틀입력해서 호출합니다.
        view.addSubview(textfield)
        view.addSubview(memotext) // 뷰의 에디디서브뷰함수를 파라미터의 메모텍스트입력해서 호출합니다.
        view.backgroundColor = .white
        
        button.setTitle("수정", for: .normal) // 버튼의 setTitle 함수를 호출합니다.
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
        
        // 09.12 저녁 : 여기 공부해 보세요.
        if ischange == true {
            button.setTitle("수정", for: .normal)
        } else {
            button.setTitle("완료", for: .normal)
        }
        
        if let entity = entity {
            textfield.text = entity.name
            memotext.text = entity.memo
            
            
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.onDismiss?()
    }
    
    //@objc func buttonTapped()
    // tutor : 해당 함수는 언제 호출(사용)이 되나요?
    // 동준님 : 완료번튼을 클릭했을경우 호출됩니다.
    @objc func buttonTapped() {// 오브젝트씨의 함수이름은 버튼탭이고 빈파라미터 반환타입은 없습니다.
        self.dismiss(animated: true, completion: nil)
        
        if ischange == false {
            coreDataManager.saveMemo(title: textfield.text!, contents: memotext.text! )
        } else {
            coreDataManager.uploadMemo(entity: entity, title: textfield.text!, sentence: memotext.text!)
        }
            
    }
}
