## swiftUI

모든 애플 플랫폼방식을 지원(iOS, watchOS, macOS, tvOS)

iOS13이상부터 사용 가능 하고 Xcode 11+ macOS Catalina+ 에서 동작



#### 프로젝트 설정방법

<img width="1512" alt="스크린샷 2020-07-10 오후 1 46 01" src="https://user-images.githubusercontent.com/47776915/87117583-e0857a80-c2b3-11ea-8577-f9e952845f05.png">

![스크린샷 2020-07-10 오후 2 03 24](https://user-images.githubusercontent.com/47776915/87118352-20e5f800-c2b6-11ea-8ade-679dd58fad49.png)

타겟을 Generic iOS Device로 설정해야 한다.

왼쪽으로는 코드를 작성할 수 있고 오른쪽 프리뷰로는 미리보기가 가능한다.

프리뷰는 미리보기 뿐만 아니라 상태를 변경 할 수도 있고 변경된 상태는 왼쪽에 코드에도 반영이 된다.





![스크린샷 2020-07-10 오후 2 08 01](https://user-images.githubusercontent.com/47776915/87118597-c6996700-c2b6-11ea-91d4-0f31b5f03285.png)

커멘드키를 누르고 Label을 눌러보면 컨텍스트 메뉴가 나온다.



Shift+Cmd+L 라이브러리에서 추가가능한 뷰목록 을 끌고와서 추가할수 있다. (코드와 프리뷰 모두 가능)

Shift+Cmd+A를 누르면 포커스한 항목에 대한 액션메뉴가 표시된다. ( = Option + 클릭)



![스크린샷 2020-07-10 오후 2 21 13](https://user-images.githubusercontent.com/47776915/87119330-9f439980-c2b8-11ea-856f-83c3555c3709.png)

새로운 속성을 추가하거나 코드를 복사 붙여넣을떄 업데이트가 중단되는 경우가 많다

우측 상단의 Resume버튼을 누르거나

Opt + Cmd + P 단축키를 누르면 프리뷰를 업데이트 할 수 있다.





<img width="834" alt="스크린샷 2020-07-10 오후 4 50 34" src="https://user-images.githubusercontent.com/47776915/87130203-7bd71980-c2cd-11ea-8d80-b7c334f32cd3.png">

Live Preview 버튼을 우클릭하면 Live Preview와 Debug Preview 중 선택할수 있다.



##### SwiftUI를 공부하면서 드는 생각은 Combine은 SwiftUI와 함께 써야 Apple이 Combine을 만든 의도를 살릴 수 있습니다









# Lecture1

 swiftUI → functional programmaing

UIkit → OOP



Pakage is SwiftUI



MVVM은 code organizingModel로 우리의 코드를 organize 할지 결정

swiftUI는 MVVM없이는 할수 없다



```
The ViewModel does not talk directly to its Views
```



![스크린샷 2020-11-11 오후 6 37 28](https://user-images.githubusercontent.com/47776915/98794919-f61ad480-244c-11eb-88f3-944ebb150936.png)



![스크린샷 2020-11-11 오후 6 46 18](https://user-images.githubusercontent.com/47776915/98795948-32026980-244e-11eb-8058-ba30ae830fb7.png)



#### Types

struct

Class 

protocol

"Don't Care" type (aka generics)

enum

Functions 



\* The ViewModel in MVVM is always a Class (also, UIKit is calss-based)







## Lecture2



#### @State

SwiftUI’s views should be structs, which means they are immutable by default. If this were our own code we could mark methods using `mutating` to tell Swift they will change values, but we can’t do that in SwiftUI because it uses a computed property.

~~~swift
@State private var runCount = 0
~~~



#### \\.self 

 SwiftUI will automatically use its `id` property for uniquing

 `\.self` works for anything that conforms to `Hashable`

