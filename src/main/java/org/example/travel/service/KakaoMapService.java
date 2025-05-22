package org.example.travel.service;

import org.example.travel.dto.KakaoMapDTO;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@Service
public class KakaoMapService {

    @Value("${api-key.kakao}")
    private String kakaoApiKey;

    private final RestTemplate restTemplate;

    public KakaoMapService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public KakaoMapDTO getPlaceDetail(String placeName) {
        if (placeName == null || placeName.trim().isEmpty()) {
            System.out.println("❌ placeName 파라미터가 비어 있습니다.");
            return null;
        }

        URI uri = UriComponentsBuilder
                .fromUriString("https://dapi.kakao.com/v2/local/search/keyword.json")
                .queryParam("query", placeName)
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
                KakaoMapDTO dto = new KakaoMapDTO();
                dto.setPlaceName(place.getString("place_name"));
                dto.setAddressName(place.getString("address_name"));
                dto.setLat(place.getDouble("y"));
                dto.setLng(place.getDouble("x"));
                return dto;
            }
        } catch (Exception e) {
            System.out.println("❌ 예외 발생: " + e.getMessage());
        }

        return null;
    }
}
