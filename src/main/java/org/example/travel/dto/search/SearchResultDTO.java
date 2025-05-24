package org.example.travel.dto.search;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchResultDTO {
    private SearchHeaderDTO header;
    private SearchBodyDTO body;
}
