package org.example.travel.dto.search;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchItemDTO {

    private String addr1;            // 주소 (기본)
    private String addr2;            // 주소 (상세)
    private String zipcode;          // 우편번호

    private String areacode;         // 지역코드 (예: 39=제주)

    private String cat1;             // 대분류 코드 (예: A01=자연)
    private String cat2;             // 중분류 코드
    private String cat3;             // 소분류 코드

    private String contentid;        // 콘텐츠 ID (관광지 고유 ID)
    private String contenttypeid;    // 콘텐츠 유형 ID (예: 12=관광지, 38=시장 등)

    private String createdtime;      // 등록일 (yyyyMMddHHmmss)
    private String modifiedtime;     // 수정일 (yyyyMMddHHmmss)

    private String firstimage;       // 대표 이미지 URL
    private String firstimage2;      // 대표 이미지 (썸네일 등) 보조 URL

    private String cpyrhtDivCd;      // 저작권 구분 코드 (Type1~3)

    private String mapx;             // 지도 X좌표 (경도)
    private String mapy;             // 지도 Y좌표 (위도)
    private String mlevel;           // 지도 확대 수준 (예: 6)

    private String sigungucode;      // 시군구 코드

    private String tel;              // 전화번호
    private String title;            // 제목 (관광지명, 시장명 등)

    private String lDongRegnCd;      // 행정동 코드
    private String lDongSignguCd;    // 행정시군구 코드

    private String lclsSystm1;       // 지역 시스템 대분류
    private String lclsSystm2;       // 지역 시스템 중분류
    private String lclsSystm3;       // 지역 시스템 소분류
}
