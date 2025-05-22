package org.example.travel.dto.tourist;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class TouristItemsDTO {
    private List<TouristItemDTO> item;
}
