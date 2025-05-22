package org.example.travel.dto.detail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailBodyDTO {
    private DetailItemsDTO items;
    private int numOfRows;
    private int pageNo;
    private int totalCount;
}
