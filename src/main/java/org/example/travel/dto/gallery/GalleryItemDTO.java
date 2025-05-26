package org.example.travel.dto.gallery;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GalleryItemDTO {

	private String galContentId;			// 콘텐츠 아이디
	private String galContentTypeId;		// 콘텐츠 타입 아이디
	private String galTitle;				// 제목
	private String galWebImageUrl;			// 웹용 이미지 경로
	private String galCreatetime;			// 등록일
	private String galModifiedtime;			// 수정일
	private String galPhotographyMonth;		// 촬영월
	private String galPhotographyLocation;	// 촬영장소
	private String galPhotographer;			// 촬영자
	private String galSearchKeyword;		// 검색 키워드
}
