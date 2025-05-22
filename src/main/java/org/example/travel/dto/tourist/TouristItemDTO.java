package org.example.travel.dto.tourist;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
@Setter
public class TouristItemDTO {
    private String baseYm;             // 기준 연월 (예: "202503")
    private String tAtsNm;             // 기준 관광지명 (예: "거리공원")
    private String areaCd;             // 기준 지역 코드 (예: "11")
    private String areaNm;             // 기준 지역 이름 (예: "서울특별시")
    private String signguCd;           // 기준 시군구 코드 (예: "11530")
    private String signguNm;           // 기준 시군구 이름 (예: "구로구")
    private String rlteTatsNm;         // 연관 관광지명 (예: "스타벅스/구산역점")
    private String rlteRegnCd;         // 연관 지역 코드 (예: "11")
    private String rlteRegnNm;         // 연관 지역 이름 (예: "서울특별시")
    private String rlteSignguCd;       // 연관 시군구 코드 (예: "11380")
    private String rlteSignguNm;       // 연관 시군구 이름 (예: "은평구")
    private String rlteBsicAdres;      // 연관지 기본 주소 (예: "서울 은평구 연서로 146-0")
    private String rlteCtgryLclsNm;    // 연관지 분류 대분류 (예: "음식")
    private String rlteCtgryMclsNm;    // 연관지 분류 중분류 (예: "음식")
    private String rlteCtgrySclsNm;    // 연관지 분류 소분류 (예: "카페/찻집")
    private String rlteRank;           // 연관도 순위 (예: "16")
}
