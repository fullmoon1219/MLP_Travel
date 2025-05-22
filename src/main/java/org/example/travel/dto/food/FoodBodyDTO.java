package org.example.travel.dto.food;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FoodBodyDTO {
    private FoodItemsDTO items;
    private int numOfRows;
    private int pageNo;
    private int totalCount;
}
