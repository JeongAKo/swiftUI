<img width="500" alt="스크린샷 2021-07-10 오후 8 44 22" src="https://user-images.githubusercontent.com/47776915/125161870-ced4fc80-e1bf-11eb-854d-3604d03f8f1f.png">

 

~~~swift
func someFunction{ 
  //some code 
}

class someClass{ 
	func someMethod{ 
	//some code 
	} 
}

~~~



##  @Binding

$가 붙으면 값을 수정가능한 Binding타입을 참조







## @Environment

특정 뷰에서 EnvironmentValues의 특정 요소를 읽어와 뷰 구성에 반영

장치가 다크 모드인지 라이트 모드인지, 뷰가 렌더링되는 크기 등급, 시스템에서 가져온 고정 속성을 읽는 등 서로 다른 특징으로 표현하기에 유용

~~~swift
@Environment(\.colorScheme) var colorScheme
let opacity = colorScheme == .dark ? 0.1 : 0.3
~~~

