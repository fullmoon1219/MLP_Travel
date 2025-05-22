package org.example.travel.dto.nearby;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NearByBodyDTO {
    private NearByItemsDTO items;  // item 배열 포함
    private int numOfRows;         // 페이지당 항목 수
    private int pageNo;            // 현재 페이지 번호
    private int totalCount;        // 전체 항목 수
}
