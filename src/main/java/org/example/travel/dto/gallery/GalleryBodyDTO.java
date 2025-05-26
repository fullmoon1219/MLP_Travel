package org.example.travel.dto.gallery;

import lombok.Getter;
import lombok.Setter;
import org.example.travel.dto.district.DistrictItemsDTO;

@Getter
@Setter
public class GalleryBodyDTO {
	private GalleryItemsDTO items;
	private int numOfRows;
	private int pageNo;
	private int totalCount;
}
