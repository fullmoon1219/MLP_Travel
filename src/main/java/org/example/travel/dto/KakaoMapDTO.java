package org.example.travel.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class KakaoMapDTO {
    private String placeName;
    private String addressName;
    private double lat;
    private double lng;
}

