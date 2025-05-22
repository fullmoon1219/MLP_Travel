package org.example.travel.dto.food;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class FoodItemsDTO {
    private List<FoodItemDTO> item;
}
