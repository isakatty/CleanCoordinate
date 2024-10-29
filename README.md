
### Clean Architecture
<img width="1148" alt="image" src="https://github.com/user-attachments/assets/59c763f3-90a6-4a33-b7b8-ec5761bb74a3">

- SOLID의 단일 책임 원칙을 준수
- protocol을 활용해 의존성 역전을 통해 상위 레이어는 하위 레이어를 의존하지 않게 구현
- ViewController에서 ViewModel을 주입받을 시, UseCase, Repository, Network, Mapper를 주입 받아야하는 상황
    - DIContainer를 만들어서 주입시켜주는 방향.
- DTO와 Entity 변환하는 Mapper

 