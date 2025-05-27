package org.example.travel.controller;

import org.example.travel.constant.AreaCode;
import org.example.travel.dto.detail.DetailItemDTO;
import org.example.travel.dto.detail.DetailResponseDTO;
import org.example.travel.dto.district.DistrictItemDTO;
import org.example.travel.dto.district.DistrictResponseDTO;
import org.example.travel.dto.food.FoodItemDTO;
import org.example.travel.dto.food.FoodResponseDTO;
import org.example.travel.dto.image.ImageItemDTO;
import org.example.travel.dto.image.ImageResponseDTO;
import org.example.travel.dto.nearby.NearByItemDTO;
import org.example.travel.dto.nearby.NearByResponseDTO;
import org.example.travel.dto.search.SearchItemDTO;
import org.example.travel.dto.search.SearchResponseDTO;
import org.example.travel.service.TouristService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class TravelController {

    private final TouristService touristService;

    @Autowired
    public TravelController(TouristService touristService) {
        this.touristService = touristService;
    }

    @RequestMapping("/")
    public String index(Model model) {

        Map<String, String> params = Map.of(
                "pageNo", "1",
                "numOfRows", "100",
                "MobileOS", "WEB",
                "MobileApp", "AppTest",
                "arrange", "Q",
                "contentTypeId", "12"
        );

        DistrictResponseDTO dto = touristService.fetchData(
                "https://apis.data.go.kr/B551011/KorService2/areaBasedList2",
                params,
                DistrictResponseDTO.class
        );

        List<DistrictItemDTO> list = dto.getResponse().getBody().getItems().getItem();

        Collections.shuffle(list);

        int limit = Math.min(9, list.size());
        List<DistrictItemDTO> randomList = list.subList(0, limit);

        model.addAttribute("allLists", randomList);

        return "index";
    }

    @GetMapping("/search")
    public String search(
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "1") int page,
            Model model
    ) {
        model.addAttribute("keyword", keyword == null ? "" : keyword);
        model.addAttribute("page", page);
        model.addAttribute("activePath", "/search");

        if (keyword == null || keyword.isBlank()) {
            model.addAttribute("totalCount", 0);
            model.addAttribute("totalPage", 1);
        } else {
            String encodedKeyword = URLEncoder.encode(keyword, StandardCharsets.UTF_8);

            Map<String, String> params = Map.of(
                    "pageNo", String.valueOf(page),
                    "numOfRows", "6",
                    "MobileOS", "WEB",
                    "MobileApp", "AppTest",
                    "arrange", "Q",
                    "keyword", encodedKeyword,
                    "_type", "json"
            );

            SearchResponseDTO dto = touristService.fetchData(
                    "https://apis.data.go.kr/B551011/KorService2/searchKeyword2",
                    params,
                    SearchResponseDTO.class
            );

            if (dto == null || dto.getResponse() == null || dto.getResponse().getBody() == null ||
                    dto.getResponse().getBody().getItems() == null || dto.getResponse().getBody().getItems().getItem() == null) {

                model.addAttribute("searchLists", Collections.emptyList());
                model.addAttribute("totalCount", 0);
                model.addAttribute("totalPage", 1);
            } else {
                List<SearchItemDTO> list = dto.getResponse().getBody().getItems().getItem();
                int totalCount = dto.getResponse().getBody().getTotalCount();
                int totalPage = (int) Math.ceil((double) totalCount / 6.0);

                model.addAttribute("searchLists", list);
                model.addAttribute("totalCount", totalCount);
                model.addAttribute("totalPage", totalPage);
            }
        }

        Map<String, String> randomParams = Map.of(
                "pageNo", "1",
                "numOfRows", "100",
                "MobileOS", "WEB",
                "MobileApp", "AppTest",
                "arrange", "Q",
                "contentTypeId", "12",
                "_type", "json"
        );

        DistrictResponseDTO random = touristService.fetchData(
                "https://apis.data.go.kr/B551011/KorService2/areaBasedList2",
                randomParams,
                DistrictResponseDTO.class
        );

        if (random != null && random.getResponse() != null &&
                random.getResponse().getBody() != null &&
                random.getResponse().getBody().getItems() != null) {

            List<DistrictItemDTO> list2 = random.getResponse().getBody().getItems().getItem();
            Collections.shuffle(list2);
            int limit = Math.min(3, list2.size());
            model.addAttribute("randomLists", list2.subList(0, limit));
        } else {
            model.addAttribute("randomLists", Collections.emptyList());
        }

        return "search/search";
    }

    @GetMapping("/view")
    public String viewDetail(@RequestParam String page,
                             @RequestParam("contentId") String contentId, Model model) {

        // 1. 상세 정보 조회
        Map<String, String> detailParams = Map.of(
                "contentId", contentId,
                "MobileOS", "WEB",
                "MobileApp", "AppTest"
        );

        DetailResponseDTO detailDto = touristService.fetchData(
                "https://apis.data.go.kr/B551011/KorService2/detailCommon2",
                detailParams,
                DetailResponseDTO.class
        );

        DetailItemDTO detail = null;

        if (detailDto != null && detailDto.getResponse() != null &&
                detailDto.getResponse().getBody() != null &&
                detailDto.getResponse().getBody().getItems() != null &&
                detailDto.getResponse().getBody().getItems().getItem() != null &&
                !detailDto.getResponse().getBody().getItems().getItem().isEmpty()) {

            detail = detailDto.getResponse().getBody().getItems().getItem().get(0);
        }

        model.addAttribute("detail", detail);
        model.addAttribute("page", page);
        model.addAttribute("contentId", contentId);
        model.addAttribute("region", AreaCode.AREA_CODE_MAP);

        Map<String, String> imgParams = Map.of(
                "contentId", contentId,
                "imageYN", "Y",
                "MobileOS", "WEB",
                "MobileApp", "AppTest",
                "pageNo", "1",
                "numOfRows", "5"
        );

        ImageResponseDTO imageDto = touristService.fetchData(
                "https://apis.data.go.kr/B551011/KorService2/detailImage2",
                imgParams,
                ImageResponseDTO.class
        );

        List<ImageItemDTO> images = null;

        if (imageDto != null && imageDto.getResponse() != null &&
                imageDto.getResponse().getBody() != null &&
                imageDto.getResponse().getBody().getItems() != null &&
                imageDto.getResponse().getBody().getItems().getItem() != null &&
                !imageDto.getResponse().getBody().getItems().getItem().isEmpty()) {

            images = imageDto.getResponse().getBody().getItems().getItem();
        }

        model.addAttribute("images", images);


        // 2. 위도/경도 기반 관광지 및 음식점 조회
        if (detail != null && detail.getMapx() != null && detail.getMapy() != null) {

            // 관광지(12), 음식점(39), 숙박시설(32)
            int[] contentTypeIds = {12, 39, 32};
            String[] modelKeys = {"nearbyTourist", "nearbyFood", "nearbyAccom"};

            for (int i = 0; i < contentTypeIds.length; i++) {
                Map<String, String> params = Map.of(
                        "mapX", detail.getMapx(),
                        "mapY", detail.getMapy(),
                        "radius", "1000",
                        "numOfRows", "10",
                        "pageNo", "1",
                        "MobileOS", "WEB",
                        "MobileApp", "AppTest",
                        "arrange", "C",
                        "contentTypeId", String.valueOf(contentTypeIds[i]),
                        "areaCode", detail.getAreacode()
                );

                NearByResponseDTO dto = touristService.fetchData(
                        "https://apis.data.go.kr/B551011/KorService2/locationBasedList2",
                        params,
                        NearByResponseDTO.class
                );

                List<NearByItemDTO> list = Collections.emptyList();
                if (dto != null && dto.getResponse() != null &&
                        dto.getResponse().getBody() != null &&
                        dto.getResponse().getBody().getItems() != null &&
                        dto.getResponse().getBody().getItems().getItem() != null) {

                    list = dto.getResponse().getBody().getItems().getItem();
                }

                model.addAttribute(modelKeys[i], list);
            }
        }

        return "places/view";
    }

    @GetMapping("/district")
    public String viewList(@RequestParam(required = false) String areaCode,
                           @RequestParam(defaultValue = "1") String page,
                           Model model) {
        populateTourList(model, areaCode, page, 12, "districts", "district");
        return "list/districtList";
    }

    @GetMapping("/food")
    public String viewFoodList(@RequestParam(required = false) String areaCode,
                               @RequestParam(defaultValue = "1") String page,
                               Model model) {
        populateTourList(model, areaCode, page, 39, "foods", "food");
        return "list/foodList";
    }

    @GetMapping("/accom")
    public String viewAccom(@RequestParam(required = false) String areaCode,
                            @RequestParam(defaultValue = "1") String page,
                            Model model) {
        populateTourList(model, areaCode, page, 32, "accoms", "accom");
        return "list/accomList";
    }

    private void populateTourList(Model model, String areaCode, String page,
                                  int contentTypeId, String modelKey, String viewName) {
        Map<String, String> params = new HashMap<>();
        params.put("pageNo", page);
        params.put("numOfRows", "12");
        params.put("MobileOS", "WEB");
        params.put("MobileApp", "AppTest");
        params.put("arrange", "C");
        params.put("contentTypeId", String.valueOf(contentTypeId));

        if (areaCode != null && !areaCode.isBlank()) {
            params.put("areaCode", areaCode);
        }

        DistrictResponseDTO dto = touristService.fetchData(
                "https://apis.data.go.kr/B551011/KorService2/areaBasedList2",
                params,
                DistrictResponseDTO.class
        );

        List<DistrictItemDTO> list = dto.getResponse().getBody().getItems().getItem();

        int totalCount = dto.getResponse().getBody().getTotalCount();
        int totalPage = (int) Math.ceil((double) totalCount / 12.0);

        model.addAttribute(modelKey, list);
        model.addAttribute("page", page);
        model.addAttribute("areaCode", areaCode);
        model.addAttribute("region", AreaCode.AREA_CODE_MAP);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("activePath", "/" + viewName);
    }

}
