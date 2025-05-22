package org.example.travel.dto.tourist;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class TouristBodyDTO {
    private TouristItemsDTO items;
    private int numOfRows;
    private int pageNo;
    private int totalCount;
}
