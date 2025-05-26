package org.example.travel.dto.detail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailItemDTO {
    private String contentid;
    private String contenttypeid;
    private String title;
    private String createdtime;
    private String modifiedtime;
    private String tel;
    private String telname;
    private String homepage;
    private String firstimage;
    private String firstimage2;
    private String cpyrhtDivCd;
    private String areacode;
    private String sigungucode;
    private String lDongRegnCd;
    private String lDongSignguCd;
    private String lclsSystm1;
    private String lclsSystm2;
    private String lclsSystm3;
    private String cat1;
    private String cat2;
    private String cat3;
    private String addr1;
    private String addr2;
    private String zipcode;
    private String mapx;
    private String mapy;
    private String mlevel;
    private String overview;

    public String getOverview() {
        if (overview == null) return "";

        String[] words = overview.split("\\.\\s*");

        StringBuilder sb = new StringBuilder();

        for (String word : words) {
            if (!word.trim().isEmpty()) {
                sb.append(word.trim()).append(".<br>");
            }
        }

        return sb.toString();
    }
}
