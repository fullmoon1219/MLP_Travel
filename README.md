# 🧭 여행 가자! - 전국 관광 정보 플랫폼

> **Spring Boot + JSP 기반 전국 관광지 정보 제공 웹 애플리케이션**

공공데이터 API와 Kakao Map API를 활용하여 전국 관광지, 음식점, 숙박 시설에 대한 상세 정보와 지도 위치, 주변 장소까지 제공하는 웹 플랫폼입니다.

---

## 🛠 기술 스택

- **Backend**: Spring Boot, Spring MVC
- **Frontend**: JSP, HTML, CSS, JavaScript (jQuery)
- **Template Engine**: JSP
- **API 활용**:
  - 공공데이터포털 `TourAPI` (한국관광공사)
  - Kakao Map API

---

## 📂 프로젝트 구조

```
src
└── main
    ├── java
    │   └── org.example.travel
    │       ├── config             # RestTemplate 설정
    │       ├── constant           # 지역코드 상수
    │       ├── controller         # 요청 처리 컨트롤러
    │       ├── dto                # 공공데이터 응답 DTO
    │       └── service            # 외부 API 호출 및 비즈니스 로직
    ├── resources
    │   └── application.yml        # DB 및 API 설정
    └── webapp
        └── WEB-INF/views          # JSP 페이지
```

---

## 📌 주요 기능

### 🔍 검색
- 키워드 기반 전국 관광지 검색
- 결과 리스트 및 상세 페이지 제공
- 결과 페이징 처리

### 📍 지역별 보기
- 서울, 경기, 부산 등 17개 지역 선택
- 관광지 / 숙소 / 음식점 유형별 분류 제공

### 🗺 상세 페이지
- Kakao 지도 표시
- API로 불러온 대표 이미지 슬라이드
- 상세 설명, 주소, 전화번호, 분류 표시
- 반경 1km 내 주변 관광지, 숙소, 음식점 추천

### 🎯 추천 관광지
- 메인 페이지에서 무작위 관광지 9곳 노출

---

## 🌐 화면 미리보기

- 메인 페이지  
  ![](./images/gif/main.gif)

- 검색 결과  
  ![](./images/gif/search.gif)

- 지역별 페이지  
  ![](./images/gif/list.gif)

- 상세 페이지  
  ![](./images/gif/main_list.gif)
  
- 카카오맵 API 
  ![](./images/gif/kakaomap.gif)
  
---

## ⚙️ 설정 방법

### 1. `application.yml` 설정

```yaml
spring:
  application:
    name: "Travel"

  mvc:
    view:
      prefix: "/WEB-INF/views/"
      suffix: ".jsp"

api-key:
  kakao: "KakaoAK [YOUR_KAKAO_API_KEY]"
  tourist: "[ENCODED_PUBLIC_DATA_API_KEY]"

server:
  port: 8080
```

> 실제 사용 시 개인 API 키로 교체

---

## 🚀 실행 방법

```bash
# 1. DB 연결 확인
# 2. API 키 입력
# 3. 프로젝트 실행
./gradlew bootRun   # 또는 IDE에서 실행
```

웹 브라우저에서 [http://localhost:8080](http://localhost:8080) 접속

---

## 🙌 팀 정보

- MLP(Multicampus Learning Platform) 미니 팀 프로젝트 수행과정입니다.
- 본 프로젝트는 2025년 **전국 여행 정보 제공 웹 플랫폼**으로 제작되었습니다.
- 주요 구현자: **[김자연, 김지영, 박광수, 오한나]**
