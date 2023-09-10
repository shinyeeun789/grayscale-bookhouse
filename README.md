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
- grayscale의 기능을 사용하기 위해서는 로그인 필수
- 입력받은 아이디와 비밀번호를 데이터베이스의 데이터와 비교하여 값이 일치하면 성공, 일치하지 않으면 실패
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/e5883041-032f-46d0-b980-966e9adadb5f">
      <sub><b> PIC1 : 로그인</sub></b>
    </td>
  </tr>
</table>
        
#### (3) 마이페이지
- 로그인한 사용자의 개인 정보 변경 가능
- 주문/배송 목록 화면 구현
- 취소/반품/교환 목록 화면 구현
- 내가 작성한 리뷰 목록 기능 구현
- 리뷰 작성 가능한 상품 목록 기능 구현
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/d8b87b8a-e8c8-4eee-9c29-e141de20c1d6">
      <sub><b> PIC1 : 개인정보 확인 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/ea514197-7e43-41e7-91f1-2a4e64bf9733">
      <sub><b> PIC2 : 개인정보 변경 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/6a2c6154-e138-4a0b-8984-59143d1d0cf9">
      <sub><b> PIC3 : 주문/배송 조회 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/13b0d3fa-1099-40dd-aef7-e28fd13a9ee7">
      <sub><b> PIC4 : 리뷰 관리 </sub></b>
    </td>
  </tr>
</table>

### 2. 관리자 기능
#### (1) 관리자 페이지
- chart.js를 활용하여 매출액 추이, 상품 판매 건수 출력
- 상품 관리, 리뷰 관리 페이지로 이동 가능한 메뉴바 출력
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/ab48322e-190a-4ec2-87db-17c20512a46a">
      <sub><b> PIC1 : Dashboard </sub></b>
    </td>
  </tr>
</table>

#### (2) 상품 관리
- 상품 목록, 카테고리, 입고가, 재고, 현재 가격의 정보를 담고 있는 표를 출력하는 화면 구현
- 상품 이미지, 상품명, 상품 설명, 상품 가격, 상품의 목차 데이터를 입력받아 상품을 추가하는 기능 구현
- 상품 테이블에 존재하는 상품 목록 중 입고하고자 하는 상품의 입고 수량과 입고 가격을 입력한 후 입고 테이블에 저장
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/fc52fb42-d7fd-4d65-b6ed-466541927590">
      <sub><b> PIC1 : 상품 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/bfb9cff1-3dd4-4c0e-b3c3-f9d49ba2920f">
      <sub><b> PIC2 : 상품 등록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/dc3d7118-44d7-4b6a-bb86-199909c7992a">
      <sub><b> PIC3 : 상품 입고 </sub></b>
    </td>
  </tr>
</table>

#### (3) 배송 정보 관리
- 결제완료 주문건과 배송상태 변경건의 상품명을 클릭할 경우, 송장번호와 배송 정보를 업데이트 할 수 있는 기능 구현
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/e74c284a-c78c-44b1-ba26-8ab0765b78fa">
      <sub><b> PIC1 : 배송 정보 관리 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/06be8ff8-3ee1-4ecd-b101-94cfda219724">
      <sub><b> PIC2 : 배송정보 변경 </sub></b>
    </td>
  </tr>
</table>

#### (4) 리뷰 관리
- 상품에 대한 리뷰 목록을 출력하는 화면 구현
- 관리자가 삭제하고자 하는 리뷰를 리뷰 테이블에서 삭제할 수 있는 기능 구현
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/4fe65499-9819-4964-a054-d40153dacc73">
      <sub><b> PIC1 : 리뷰 관리 </sub></b>
    </td>
  </tr>
</table>

### 3. 고객지원 기능
#### (1) 공지사항
- 공지사항의 글 작성, 글 수정, 글 상세 보기, 글 삭제 기능 구현
- 관리자만 공지사항 글 작성, 글 수정, 글 삭제 기능에 접근 가능
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/ad93f268-af70-4dd4-ba9b-e146960cd079">
      <sub><b> PIC1 : 공지사항 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/641c6d4a-5faa-4809-9a45-b102fde25cf6">
      <sub><b> PIC2 : 공지사항 글 상세 보기 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/5d117475-e811-44ee-8fb0-f120ac6873ed">
      <sub><b> PIC3 : 공지사항 글 수정 </sub></b>
    </td>
  </tr>
</table>

#### (2) QnA
- QnA의 글 작성, 글 상세 보기, 글 삭제 기능 구현
- 질문글은 일반 사용자, 관리자 모두 등록 가능
- 답변글은 관리자만 등록 가능
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/60aed680-f432-419a-847e-39ca6ae52dd5">
      <sub><b> PIC1 : QnA 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/0d7b51c9-d8f1-48b3-9c41-5f45f46ccf9c">
      <sub><b> PIC2 : 질문 글 상세 보기 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/f987e8ff-02ca-4c32-a963-997a9dec4500">
      <sub><b> PIC3 : 답변 글 상세 보기 </sub></b>
    </td>
  </tr>
</table>

### 4. 상품 판매 기능
#### (1) 상품 목록
- 카테고리 별 상품의 목록 출력
- 인기 상품 목록 출력
- 신상품 목록 출력
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/fc8a15c2-7b0e-4ec7-a1d3-21c65141875b">
      <sub><b> PIC1 : 카테고리 별 상품 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/f4c47277-ecaa-40ea-b47d-d79e688b6e74">
      <sub><b> PIC2 : 인기 상품 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/1d78e977-b926-458d-9c05-9283d5f75dcd">
      <sub><b> PIC3 : 신상품 목록 </sub></b>
    </td>
  </tr>
</table>

#### (2) 상품 상세 페이지
- 상품 이미지, 상품명, 상품 설명, 상품 가격, 상품의 목차와 상품의 리뷰를 출력하는 화면 구현
- 상품은 반드시 장바구니에 담기 후에만 결제 가능
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/6e782966-b541-4ca2-9659-56207930cc3d">
      <sub><b> PIC1 : 상품 상세 보기(1) </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/9b0bcaa3-d01d-44a3-a4be-ca4493dfdbe5">
      <sub><b> PIC2 : 상품 상세 보기(2) </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/4aeeef40-c5d1-4c81-ac2c-ad8989f88b48">
      <sub><b> PIC3 : 상품 상세 보기(3) </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/233e358f-3825-464a-926a-28dfa4130448">
      <sub><b> PIC4 : 상품 상세 보기의 리뷰 </sub></b>
    </td>
  </tr>
</table>


#### (3) 장바구니 페이지
- 사용자가 장바구니에 담은 상품명, 상품 이미지, 상품 가격, 상품 개수, 상품 총 가격, 결제 금액, 구매하기 버튼을 출력하는 화면 구현
- 장바구니 추가 시 추가하고자 하는 상품이 이미 장바구니에 있다면 개수를 UPDATE하고, 같은 상품이 없다면 INSERT하도록 구현
- 상품의 가격과 상품의 개수로 상품별 총 금액을 계산하여 출력
- 상품별 총 금액을 합하여 총 결제 금액 출력

#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/8503af34-3b02-4ece-a9a6-9e3089a895ee">
      <sub><b> PIC1 : 장바구니 페이지 </sub></b>
    </td>
  </tr>
</table>


#### (4) 결제 페이지
- 주문자 정보와 배송지 정보를 출력하는 결제 화면 구현
- 배송지 정보를 주문자 정보와 다르게 설정할 수 있도록 구현
- 주문자 정보와 동일 버튼을 클릭하면 현재 로그인되어 있는 사용자의 정보가 배송지 정보에 자동으로 입력됨
- 결제하기 버튼을 누르면 iamport의 kicc와 연동되어 결제창 출력됨
- 결제 완료 후 구매하기 버튼을 눌러 결제 데이터, 배송 데이터, 출고 데이터를 데이터베이스에 입력하여 결제 처리
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/497f295c-7cb4-4575-8f34-820e2a27ea4a">
      <sub><b> PIC1 : 결제 페이지(1) </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/eb7c7e68-3043-4d4e-846b-432849149168">
      <sub><b> PIC2 : 결제 페이지(2) </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/332e331c-71f4-4adb-9a4e-2bba655cb977">
      <sub><b> PIC3 : iamport 결제창 </sub></b>
    </td>
  </tr>
</table>

#### (5) 리뷰 작성 페이지
- 마이페이지의 리뷰 관리 페이지에서 구매확정 버튼 클릭 시 접근 가능
- 입력된 리뷰 글을 리뷰 테이블에 저장
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/grayscale_bookhouse/assets/70800414/0a818d45-1b0a-4fa3-97d0-3aebd6d9ac72">
      <sub><b> PIC1 : 리뷰 작성 </sub></b>
    </td>
  </tr>
</table>
