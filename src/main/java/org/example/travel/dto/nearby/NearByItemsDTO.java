package org.example.travel.dto.nearby;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class NearByItemsDTO {
    private List<NearByItemDTO> item;  // 관광지 목록
}
