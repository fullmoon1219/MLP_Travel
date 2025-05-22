package org.example.travel.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
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
    public String home() {
        return "index";
    }

    @GetMapping("/view")
    public String viewList(Model model, @RequestParam(defaultValue = "1") String page) {
        Map<String, String> params = Map.of(
                "pageNo", page,
                "numOfRows", "10",
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
