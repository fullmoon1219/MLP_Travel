package org.example.travel.dto.district;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DistrictItemDTO {
    private String addr1;              // 주소1
    private String addr2;              // 주소2
    private String areacode;           // 지역코드
    private String cat1;               // 대분류
    private String cat2;               // 중분류
    private String cat3;               // 소분류
    private String contentid;          // 관광지 ID
    private String contenttypeid;      // 콘텐츠 유형 ID
    private String createdtime;        // 등록일시
    private String firstimage;         // 대표 이미지
    private String firstimage2;        // 추가 이미지
    private String cpyrhtDivCd;        // 저작권 코드
    private String mapx;               // 지도 X좌표
    private String mapy;               // 지도 Y좌표
    private String mlevel;             // 지도 줌 레벨
    private String modifiedtime;       // 수정일시
    private String sigungucode;        // 시군구 코드
    private String tel;                // 전화번호
    private String title;              // 제목
    private String zipcode;            // 우편번호
    private String lDongRegnCd;        // 행정동 지역 코드
    private String lDongSignguCd;      // 행정동 시군구 코드
    private String lclsSystm1;         // 분류체계1
    private String lclsSystm2;         // 분류체계2
    private String lclsSystm3;         // 분류체계3
}
