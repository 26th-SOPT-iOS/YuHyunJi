# 26th SOPT iOS
## Firstweek_seminar  
### __* 화면 간 데이터 전달__

<div>
<img width="200" alt="스크린샷 2020-04-24 오후 2 32 10" src="https://user-images.githubusercontent.com/22251299/80178580-87556580-8639-11ea-99c7-07bb3d3483a3.png">

<img width="200" alt="스크린샷 2020-04-24 오후 2 32 21" src="https://user-images.githubusercontent.com/22251299/80178640-af44c900-8639-11ea-9a10-8aec70c465c2.png">
</div>


#### FirstViewController에 들어갈 코드
```swift
@IBAction func transferData(_ sender: Any) {
    
    //(identifier: "Next viewcontroller의 storyboard ID")
    guard let receiveController = self.storyboard?.instantiateViewController(identifier: "secondViewController") as? SecondViewController else { return }
    
    receiveController.name = nameTextfield.text
    receiveController.email = emailTextfield.text
    receiveController.isOnoff = sampleSwitch.isOn
    receiveController.frequency = sampleSlider.value
    
    //코드로 뷰간의 present연결 (이때,스토리보드에선 뷰간 연결해주면 안됨)
    self.present(receiveController, animated: true, completion: nil)
    
}
```

#### SecondViewController에 들어갈 코드
```swift
   //이전 viewcontroller에서 넘겨준 데이터를 어떤 형식으로 받을지 선언
   //내부에선 아울렛 변수를 참조할 수 없어 만들어줌
   var name: String?
   var email: String?
   var isOnoff: Bool?
   var frequency: Float?
 
   //뒤로가기 Action(이때도 스토리보드에선 뷰간 연결해주면 안됨)
   @IBAction func backScreen(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
   }
```

### __* 과제1: Navigation 활용 화면이동__

![화면 기록 2020-04-24 오후 9 01 12](https://user-images.githubusercontent.com/22251299/80211902-7fb1b300-8671-11ea-9760-e2442f196006.gif style=" width:200px ")
#### storyboard에서 push로 연결
<div>
<img width="200" alt="스크린샷 2020-04-24 오후 2 37 20" src="https://user-images.githubusercontent.com/22251299/80178674-c4b9f300-8639-11ea-874b-44db2ec4ff8f.png">

<img width="200" alt="스크린샷 2020-04-24 오후 2 37 28" src="https://user-images.githubusercontent.com/22251299/80178686-d0a5b500-8639-11ea-82e4-8e757c145b63.png">

<img width="200" alt="스크린샷 2020-04-24 오후 2 37 38" src="https://user-images.githubusercontent.com/22251299/80178706-dc917700-8639-11ea-9e85-47ca7aea3871.png">
</div>


### __* 과제2: 로그인 화면 구현__

<div>
<img width="200" alt="스크린샷 2020-04-24 오후 2 44 51" src="https://user-images.githubusercontent.com/22251299/80178977-8113b900-863a-11ea-8a5c-b1d38cff16c9.png">

<img width="200" alt="스크린샷 2020-04-24 오후 2 45 21" src="https://user-images.githubusercontent.com/22251299/80179011-90930200-863a-11ea-9dde-eebd726374c3.png">

<img width="200" alt="스크린샷 2020-04-24 오후 2 45 30" src="https://user-images.githubusercontent.com/22251299/80179035-a0124b00-863a-11ea-89ca-89828169210a.png">
</div>

#### Push & Present 후 처음 뷰로 돌아갈 때
```swift  
    //navigation stack에서 RootViewController(처음 뷰)를 제외한 쌓여있는 모든 뷰를 제거하여 최상위 뷰로 되게 해줌.
    self.present(lvc, animated: true, completion: {
        self.navigationController?.popToRootViewController(animated: true)
    })
```

#### Button layout 둥글게 만들 때 
```swift  
import UIKit

class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //값이 커질수록 둥글
        self.layer.cornerRadius = 0.02 * self.bounds.size.width
        //버튼 배경색
        self.backgroundColor = UIColor(red: 8/255, green: 37/255, blue: 108/255, alpha: 1)
        //버튼의 textcolor
        self.tintColor = UIColor.white
        //버튼 text 굵기 및 크기
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //버튼의 외곽선컬러
        //self.layer.borderColor =
        //버튼의 외곽선두께: 값이 커질수록 두꺼움
        //self.layer.borderWidth =

    }
}
```

