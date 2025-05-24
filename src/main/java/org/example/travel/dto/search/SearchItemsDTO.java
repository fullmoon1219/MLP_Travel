package org.example.travel.dto.search;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class SearchItemsDTO {
    private List<SearchItemDTO> item;
}
