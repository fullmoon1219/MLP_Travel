package org.example.travel.service;

import org.example.travel.dto.PlaceDTO;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Service
public class KakaoMapService {

    @Value("${kakao.api-key}")
    private String kakaoApiKey;

    private final RestTemplate restTemplate;

    public KakaoMapService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public PlaceDTO searchByKeyword(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            System.out.println("❌ keyword 파라미터가 비어 있습니다.");
            return null;
        }

        URI uri = UriComponentsBuilder
                .fromUriString("https://dapi.kakao.com/v2/local/search/keyword.json")
                .queryParam("query", keyword)
                .encode()
                .build()
                .toUri();

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", kakaoApiKey);
        HttpEntity<?> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
            JSONObject json = new JSONObject(response.getBody());
            JSONArray documents = json.getJSONArray("documents");

            if (!documents.isEmpty()) {
                JSONObject place = documents.getJSONObject(0);
                PlaceDTO result = new PlaceDTO();
                result.setPlaceName(place.getString("place_name"));
                result.setAddressName(place.getString("address_name"));
                result.setLat(place.getDouble("y"));
                result.setLng(place.getDouble("x"));
                return result;
            }
        } catch (Exception e) {
            System.out.println("❌ 예외 발생: " + e.getMessage());
        }

        return null;
    }


}
