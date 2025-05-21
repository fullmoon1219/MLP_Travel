package org.example.travel.controller;

import org.example.travel.dto.PlaceDTO;
import org.example.travel.service.KakaoMapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("map")
public class KakaoMapController {

    private final KakaoMapService kakaoMapService;

    @Autowired
    public KakaoMapController(KakaoMapService kakaoMapService) {
        this.kakaoMapService = kakaoMapService;
    }

    @GetMapping("/search")
    public PlaceDTO search(@RequestParam String keyword) {
        return kakaoMapService.searchByKeyword(keyword);
    }

}
