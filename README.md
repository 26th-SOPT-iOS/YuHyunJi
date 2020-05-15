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

<div>
<img width="200" alt="스크린샷 2020-04-24 오후 2 37 20" src="https://user-images.githubusercontent.com/22251299/80178674-c4b9f300-8639-11ea-874b-44db2ec4ff8f.png">

<img width="200" alt="스크린샷 2020-04-24 오후 2 37 28" src="https://user-images.githubusercontent.com/22251299/80178686-d0a5b500-8639-11ea-82e4-8e757c145b63.png">

<img width="200" alt="스크린샷 2020-04-24 오후 2 37 38" src="https://user-images.githubusercontent.com/22251299/80178706-dc917700-8639-11ea-9e85-47ca7aea3871.png">
</div>

#### storyboard에서 push로 연결

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

## Secondweek_seminar  
### __* 과제1: 계산기 Autolayout__

<div>
<img width="200" alt="스크린샷 2020-05-06 오후 7 24 04" src="https://user-images.githubusercontent.com/22251299/81295006-b2fd3480-90aa-11ea-860a-455589704124.png">

<img width="200" alt="스크린샷 2020-05-06 오후 7 24 17" src="https://user-images.githubusercontent.com/22251299/81295036-c3adaa80-90aa-11ea-8dc6-860bc0701ea6.png">

<img width="200" alt="스크린샷 2020-05-06 오후 7 24 33" src="https://user-images.githubusercontent.com/22251299/81295103-daec9800-90aa-11ea-8111-9959e7dc8473.png">
</div>

<img width="474" alt="스크린샷 2020-05-07 오후 9 05 00" src="https://user-images.githubusercontent.com/22251299/81292382-77606b80-90a6-11ea-8125-6301147aea9a.png">

#### 동일한 Action을 하는 button이 여러 개일 때, 한 button의 Action을 우선 선언한 후 그 Action func의 블랙포인트('Line 26')에서 나머지 button으로 드래그해주면 된다.

### __* 과제2: Zeplin Autolayout__

<div>
<img width="200" alt="스크린샷 2020-05-07 오후 9 12 08" src="https://user-images.githubusercontent.com/22251299/81293062-a7f4d500-90a7-11ea-95a0-390614f8870e.png">

<img width="200" alt="스크린샷 2020-05-07 오후 9 12 32" src="https://user-images.githubusercontent.com/22251299/81293103-b7741e00-90a7-11ea-9eda-726cd48ff544.png">

<img width="200" alt="스크린샷 2020-05-07 오후 9 12 44" src="https://user-images.githubusercontent.com/22251299/81293132-c35fe000-90a7-11ea-8696-f29f0078f5bb.png">
</div>

#### Navigation bar 배경색 설정 및 경계선 없애는 설정
```swift  
    self.navigationController?.navigationBar.barTintColor = .white
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = false
```
#### Navigation bar backbutton custom
```swift  
    self.navigationController?.navigationBar.tintColor = UIColor(red: 7/255, green: 59/255, blue: 163/255, alpha: 1.0)
    self.navigationController?.navigationBar.topItem?.title = ""
```

## Thirdweek_seminar  
### __* UIPickerView__: 뮤직리스트 앱 만들기
### __* UITableView__ : 날씨 앱 만들기
### __* UICollectionView__: 뮤직리스트 앱 만들기

<div>
<img width="200" alt="스크린샷 2020-05-15 오후 8 11 21" src="https://user-images.githubusercontent.com/22251299/82044817-01cd4e80-96e9-11ea-886f-5af72758aceb.png">

<img width="200" alt="스크린샷 2020-05-15 오후 8 10 25" src="https://user-images.githubusercontent.com/22251299/82044862-16a9e200-96e9-11ea-95f2-92a678439608.png">

<img width="200" alt="스크린샷 2020-05-15 오후 8 09 09" src="https://user-images.githubusercontent.com/22251299/82044912-29241b80-96e9-11ea-99e3-7b51d791df6b.png">
</div>

### __* 과제1: tableview로 카카오톡 채팅 구현하기__

<div>
<img width="200" alt="스크린샷 2020-05-15 오후 7 45 18" src="https://user-images.githubusercontent.com/22251299/82042698-4d7df900-96e5-11ea-8f84-e657d91daa50.png">

<img width="200" alt="스크린샷 2020-05-15 오후 7 45 34" src="https://user-images.githubusercontent.com/22251299/82042727-5b337e80-96e5-11ea-873d-ab725c20353f.png">

<img width="200" alt="스크린샷 2020-05-15 오후 7 45 50" src="https://user-images.githubusercontent.com/22251299/82042760-67b7d700-96e5-11ea-9730-80e41c55cd45.png">
</div>

#### 원하는 cell에만 구분선을 만들고 싶을 때 :  UIview이 Height = 0.5인 선을 원하는 cell에 만들어 준  후, tableview의 구분선을 없애준다.
<img width="386" alt="스크린샷 2020-05-15 오후 7 47 21" src="https://user-images.githubusercontent.com/22251299/82043071-eb71c380-96e5-11ea-931b-3c4cb14fd560.png">

```swift  
    //tableview cell 간 구분선 없애기
    Tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
```

#### Cell header customize 하기
```swift  
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        //몇번째 section의 header를 custom 할 것인지 정하기
        if section == 2 {
            let friendCountLabel = UILabel()
            friendCountLabel.text = "친구 \(self.friendInformations.count)"
            friendCountLabel.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1.0)
            friendCountLabel.frame = CGRect.init(x: 16, y: 8, width: 35, height: 17)
            friendCountLabel.font = UIFont.systemFont(ofSize: 11)
            headerView.addSubview(friendCountLabel)
        }
        return headerView
    }
    
    //custom한 cell의 header를 제외한 다른 cell header (header height = 0으로 하여) 없애주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else if section == 1 {
            return 0
        }
        else if section == 2 {
            return 35
        }
        return tableView.sectionHeaderHeight
    }
```

#### Cell을 swipe하여 삭제하기
```swift  
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 2 {
            let deleteAction = UIContextualAction(style: .destructive, title:  "삭제", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                            success(true)
                self.friendInformations.remove(at: indexPath.row)
                self.friendTableview.reloadData()
                        })
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
        else {
            return UISwipeActionsConfiguration()
        }
    }
```

#### 설정버튼 눌렀을 때 Actionsheet 나오게 하기
```swift  
    @IBAction func settingBtnAction(_ sender: Any) {
         let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
             
         let manageAction = UIAlertAction(title: "친구 관리", style: .default)
         let settingAction = UIAlertAction(title: "전체 설정", style: .default)
       
         let cancelAction = UIAlertAction(title: "취소", style: .cancel)

         optionMenu.addAction(manageAction)
         optionMenu.addAction(settingAction)
         optionMenu.addAction(cancelAction)
             
         self.present(optionMenu, animated: true, completion: nil)
    }
```


