package org.example.travel.controller;

import org.example.travel.dto.PlaceDTO;
import org.example.travel.service.KakaoMapService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/places")
public class KakaoMapController {

    private final KakaoMapService kakaoMapService;

    public KakaoMapController(KakaoMapService kakaoMapService) {
        this.kakaoMapService = kakaoMapService;
    }

    @GetMapping("/{placeName}")
    public String getPlaceDetail(@PathVariable String placeName, Model model) {
        PlaceDTO dto = kakaoMapService.getPlaceDetail(placeName);
        model.addAttribute("place", dto);
        return "places/detail";
    }

    @GetMapping("json")
    @ResponseBody
    public PlaceDTO getPlacesJson(@RequestParam String placeName) {
        return kakaoMapService.getPlaceDetail(placeName);
    }
}
