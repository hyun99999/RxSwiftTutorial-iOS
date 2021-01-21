# RxSwiftTutorial-iOS
RxSwift 를 사용해서 textField  의 조건에 따라 비동기처리를 해보는 튜토리얼

- 비동기처리를 위해서 외부 오픈 라이브러리인 RxSwift 설치.
- 두개의 textField 를 두고 비동기처리로 조건에 맞는 경우에 label 을 hidden 하거나 button 을 enable 하게 만들었다.
- Rx 바인딩을 위해서 함수를 외부에 선언하고 그 속에 textField 의 글자수를 검사하는 함수를 subscribe 했다. 그리고 두개의 조건을 충족시키도록 observable 에 등록해주었다. viewDidLoad() 함수 안에 최종적으로 함수를 선언해줌으로써 RxSwift 사용한 비동기 처리를 진행하였다.

## 완성
<p><img src ="https://user-images.githubusercontent.com/69136340/105368593-0f0de600-5c45-11eb-86a5-e3447fc8cc4f.png" width="400"> 
<img src ="https://user-images.githubusercontent.com/69136340/105368584-0cab8c00-5c45-11eb-8923-3f30d3dedd5f.png" width="400"></p>
- 출처 : http://blog.naver.com/PostView.nhn?blogId=traeumen927&logNo=222136327867&caerTopListOpen=true&userTopListCount=5&userTopListManageOpen=false&userTopListCurrentPage=1
