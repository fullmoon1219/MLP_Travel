package org.example.travel.controller;

import org.example.travel.dto.district.DistrictItemDTO;
import org.example.travel.dto.district.DistrictResponseDTO;
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

    @RequestMapping("/search")
    public String search() {
        return "search";
    }

    @RequestMapping("/view")
    public String view() {
        return "view";
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

        return "search/district";
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
