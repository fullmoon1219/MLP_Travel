package org.example.travel.constant;

import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class AreaCode {
    public static final String SEOUL = "1";
    public static final String INCHEON = "2";
    public static final String DAEJEON = "3";
    public static final String DAEGU = "4";
    public static final String GWANGJU = "5";
    public static final String BUSAN = "6";
    public static final String ULSAN = "7";
    public static final String SEJONG = "8";
    public static final String GYEONGGI = "31";
    public static final String GANGWON = "32";
    public static final String CHUNGBUK = "33";
    public static final String CHUNGNAM = "34";
    public static final String GYEONGBUK = "35";
    public static final String GYEONGNAM = "36";
    public static final String JEONBUK = "37";
    public static final String JEONNAM = "38";
    public static final String JEJU = "39";

    private AreaCode() {}
    
    public static final Map<String, String> AREA_CODE_MAP;
    static {
        Map<String, String> map = new LinkedHashMap<>();
        map.put(SEOUL, "서울");
        map.put(INCHEON, "인천");
        map.put(DAEJEON, "대전");
        map.put(DAEGU, "대구");
        map.put(GWANGJU, "광주");
        map.put(BUSAN, "부산");
        map.put(ULSAN, "울산");
        map.put(SEJONG, "세종");
        map.put(GYEONGGI, "경기도");
        map.put(GANGWON, "강원도");
        map.put(CHUNGBUK, "충청북도");
        map.put(CHUNGNAM, "충청남도");
        map.put(JEONBUK, "전라북도");
        map.put(JEONNAM, "전라남도");
        map.put(GYEONGBUK, "경상북도");
        map.put(GYEONGNAM, "경상남도");
        map.put(JEJU, "제주");
        
        AREA_CODE_MAP = Collections.unmodifiableMap(map);
    }
}
