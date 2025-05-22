package org.example.travel.controller;

import org.example.travel.dto.PageListDTO;
import org.example.travel.dto.detail.DetailItemDTO;
import org.example.travel.dto.detail.DetailResponseDTO;
import org.example.travel.dto.district.DistrictItemDTO;
import org.example.travel.dto.district.DistrictResponseDTO;
import org.example.travel.dto.food.FoodItemDTO;
import org.example.travel.dto.food.FoodResponseDTO;
import org.example.travel.dto.nearby.NearByItemDTO;
import org.example.travel.dto.nearby.NearByResponseDTO;
import org.example.travel.dto.tourist.TouristItemDTO;
import org.example.travel.dto.tourist.TouristResponseDTO;
import org.example.travel.service.TouristService;
import org.example.travel.service.TravelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.List;
import java.util.Map;


@Controller
public class TravelController {

    private final TravelService travelService;
    private final TouristService touristService;

    @Autowired
    public TravelController(TravelService travelService, TouristService touristService) {
        this.travelService = travelService;
        this.touristService = touristService;
    }

    @RequestMapping("/")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("index");

        return modelAndView;
    }

    @RequestMapping("/list")
    public String allList(@RequestParam(defaultValue = "1") int page, Model model) {
        PageListDTO listDTO = travelService.allTravels(page);
        model.addAttribute("listDTO", listDTO);

        return "search/allList";
    }


    @GetMapping("/district")
    public String viewList(
        @RequestParam(defaultValue = "1") String areaCode,
        @RequestParam(defaultValue = "1") String page,
        Model model) {

            Map<String, String> params = Map.of(
                    "areaCode", areaCode,
                    "pageNo", page,
                    "numOfRows", "30",
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

            model.addAttribute("districts", list);
            model.addAttribute("areaCode", areaCode);

        return "search/districtList";
    }

    @GetMapping("/view")
    public String viewDetail(@RequestParam("contentId") String contentId, Model model) {

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
        model.addAttribute("contentId", contentId);

        // 2. 위도/경도 기반 관광지 및 음식점 조회
        if (detail != null && detail.getMapx() != null && detail.getMapy() != null) {

            // 관광지(12), 음식점(39)
            int[] contentTypeIds = {12, 39};
            String[] modelKeys = {"nearbyTourist", "nearbyFood"};

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



    @GetMapping("/food")
    public String viewFoodList(
            @RequestParam(defaultValue = "1") String areaCode,
            @RequestParam(defaultValue = "1") String page,
            Model model) {

        Map<String, String> params = Map.of(
                "areaCode", areaCode,
                "pageNo", page,
                "numOfRows", "10",
                "MobileOS", "WEB",
                "MobileApp", "AppTest",
                "arrange", "C",
                "contentTypeId", "39"
        );

        FoodResponseDTO dto = touristService.fetchData(
                "https://apis.data.go.kr/B551011/KorService2/areaBasedList2",
                params,
                FoodResponseDTO.class
        );

        List<FoodItemDTO> list = dto.getResponse().getBody().getItems().getItem();

        model.addAttribute("foods", list);
        model.addAttribute("areaCode", areaCode);

        return "search/food";
    }


    @GetMapping("/example")
    public String viewExample(Model model, @RequestParam(defaultValue = "1") String page) {
        Map<String, String> params = Map.of(
                "pageNo", page,
                "numOfRows", "30",
                "MobileOS", "WEB",
                "MobileApp", "AppTest",
                "baseYm", "202503",
                "areaCd", "11",
                "signguCd", "11530"
        );

        TouristResponseDTO dto = touristService.fetchData(
                "https://apis.data.go.kr/B551011/TarRlteTarService/areaBasedList",
                params,
                TouristResponseDTO.class
        );

        List<TouristItemDTO> list = dto.getResponse().getBody().getItems().getItem();

        model.addAttribute("tourists", list);

        return "places/list";
    }



}
