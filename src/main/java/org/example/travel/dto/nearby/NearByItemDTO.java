package org.example.travel.dto.nearby;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class NearByItemDTO {
    private String addr1;             // 기본 주소 예: "서울특별시 중구 명동8나길 28 (충무로1가)"
    private String addr2;             // 상세 주소 예: ""
    private String areacode;          // 지역 코드 예: "1" (서울)
    private String cat1;              // 대분류 코드 예: "A05"
    private String cat2;              // 중분류 코드 예: "A0502"
    private String cat3;              // 소분류 코드 예: "A05020100"
    private String contentid;         // 콘텐츠 고유 ID 예: "1489369"
    private String contenttypeid;     // 콘텐츠 타입 ID 예: "39" (음식점)
    private String createdtime;       // 등록일시 예: "20111213230031"
    private String dist;              // 현재 위치와의 거리 예: "219.00190924805898" (단위: m), 없을 수도 있음
    private String firstimage;        // 대표 이미지 URL 예: "http://tong.visitkorea.or.kr/cms/resource/...jpg"
    private String firstimage2;       // 추가 이미지 URL 예: "http://tong.visitkorea.or.kr/cms/resource/...jpg"
    private String cpyrhtDivCd;       // 저작권 코드 예: "Type3"
    private String mapx;              // 경도 예: "126.9834734887"
    private String mapy;              // 위도 예: "37.5614854780"
    private String mlevel;            // 지도 확대 수준 예: "6"
    private String modifiedtime;      // 수정일시 예: "20250410100619"
    private String sigungucode;       // 시군구 코드 예: "24"
    private String tel;               // 전화번호 예: "02-778-6767"
    private String title;             // 명칭 예: "오다리집"
    private String zipcode;           // 우편번호 예: "04536"
    private String lDongRegnCd;       // 행정동 지역 코드 예: "11"
    private String lDongSignguCd;     // 행정동 시군구 코드 예: "140"
    private String lclsSystm1;        // 시스템 분류 대분류 예: "FD"
    private String lclsSystm2;        // 시스템 분류 중분류 예: "FD01"
    private String lclsSystm3;        // 시스템 분류 소분류 예: "FD010100"
}
