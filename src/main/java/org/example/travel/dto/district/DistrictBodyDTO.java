package org.example.travel.dto.district;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DistrictBodyDTO {
    private DistrictItemsDTO items;
    private int numOfRows;
    private int pageNo;
    private int totalCount;
}
