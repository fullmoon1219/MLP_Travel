package org.example.travel.dto.image;

import lombok.Getter;
import lombok.Setter;
import org.example.travel.dto.district.DistrictItemsDTO;

@Getter
@Setter
public class ImageBodyDTO {
	private ImageItemsDTO items;
	private int numOfRows;
	private int pageNo;
	private int totalCount;
}
