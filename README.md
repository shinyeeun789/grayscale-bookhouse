<div align="center">
  <img src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/b99ad478-244c-4bac-90cb-be2836f711b2" height="120px">
</div>

#
교재 판매 쇼핑몰 웹 애플리케이션 개발 프로젝트입니다.

## 💻 프로젝트 소개

### 🕰 개발 기간
2023.08.20 ~ 2023.09.04

### 📚 개발 환경
![Java](https://img.shields.io/badge/Java-007396.svg?&style=for-the-badge&logo=Java&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-7952B3.svg?&style=for-the-badge&logo=bootstrap&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![jquery](https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=javascript&logoColor=white)
![ApacheTomcat](https://img.shields.io/badge/ApacheTomcat-F8DC75?style=for-the-badge&logo=ApacheTomcat&logoColor=black)
![PostgreSQL](https://img.shields.io/badge/postgresql-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)


<br/>

## 📌 프로젝트 산출물
### 1. Usecase Diagram
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram1" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/2270da62-6363-4a9b-9b4a-329fa7bb14ff">
      <sub><b> PIC1 : 회원 관리 USECASE DIAGRAM</sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram2" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/34a5502c-3730-4e77-b7ea-1a8ec3bec91b">
      <sub><b> PIC2 : 마이페이지 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram3" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/fd19a66e-fa1d-488c-845f-709512149660">
      <sub><b> PIC3 : 개인정보 변경 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram4" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/bc89a204-d022-447b-bc69-a9f1ff01c86b">
      <sub><b> PIC4 : 주문 조회 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram5" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/5e0a06a1-75ae-4d10-ae26-1d72d09f066b">
      <sub><b> PIC5 : 장바구니 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram6" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/4e3abe67-96e5-47f5-ac80-a893d83b8d12">
      <sub><b> PIC6 : 관리자 페이지 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram7" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/ff3000f9-a404-48a6-b5bb-6c1480a0a943">
      <sub><b> PIC7 : 배송 정보 관리 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram8" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/324d85ea-65ef-44f3-9495-e89f25674241">
      <sub><b> PIC8 : 상품 구매 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
</table>

### 2. 화면 설계도


### 3. ERD
<img width="1300" alt="ERD" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/5371a9c1-8902-411f-ab9e-4387e076ce40">


### 4. Class Diagram
<img width="1300" alt="ERD" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/e8063f3b-a094-4bef-aa71-74496c6cf100">

<br/>
<br/>

## 📱 주요 기능
### 1. 회원 기능
#### (1) 회원가입
- 아이디 중복 체크, 비밀번호와 비밀번호 확인의 값이 동일한지 체크한 후, 모든 조건이 true인 경우에만 회원가입할 수 있도록 구현
- 정규표현식 : 아이디(영문소문자, 숫자 조합 8글자 이상), 비밀번호(8자~16자, 영문소문자/숫자/특수문자 1개 이상)
- 다음 주소 API를 활용하여 사용자의 주소 정보를 가져와 postgreSQL에 저장
- 비밀번호는 AES256으로 암호화하여 데이터베이스에 저장
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/c5f3a0f8-727a-4428-b5be-10e475f9d90d">
      <sub><b> PIC1 : 회원 약관 동의</sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/cba9cc46-4aa5-43dd-9a56-a0a31debd900">
      <sub><b> PIC2 : 회원가입 </sub></b>
    </td>
  </tr>
</table>



#### (2) 로그인
- 아보카도의 기능을 사용하기 위해서는 로그인 필수
- 비로그인 시 FAQ 리스트만 접근 가능
#### (3) 마이페이지
- 로그인한 사용자의 개인 정보 변경 가능
- mariaDB에 저장되어 있는 암호화된 비밀번호를 복호화하여 input에 password type으로 출력
