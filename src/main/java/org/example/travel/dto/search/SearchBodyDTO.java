package org.example.travel.dto.search;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchBodyDTO {
    private SearchItemsDTO items;
    private int numOfRows;
    private int pageNo;
    private int totalCount;
}
