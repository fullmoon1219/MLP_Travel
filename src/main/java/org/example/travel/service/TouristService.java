package org.example.travel.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.Collections;
import java.util.Map;

@Service
public class TouristService {

    @Value("${api-key.tourist}")
    private String apiKey;

    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;

    public TouristService(RestTemplate restTemplate, ObjectMapper objectMapper) {
        this.restTemplate = restTemplate;
        this.objectMapper = objectMapper;
    }

    public <T> T fetchData(String baseUrl, Map<String, String> params, Class<T> responseType) {
        URI uri = buildUri(baseUrl, params);

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        HttpEntity<Void> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);

            System.out.println("✅ API 요청 성공");
            System.out.println("요청 URI: " + uri);
            System.out.println("응답 타입: " + response.getHeaders().getContentType());

            return objectMapper.readValue(response.getBody(), responseType);

        } catch (Exception e) {
            System.out.println("❌ API 요청 실패: " + e.getMessage());
            return null;
        }
    }

    private URI buildUri(String baseUrl, Map<String, String> params) {
        UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(baseUrl)
                .queryParam("serviceKey", apiKey);

        for (Map.Entry<String, String> entry : params.entrySet()) {
            builder.queryParam(entry.getKey(), entry.getValue());
        }

        return builder
                .queryParam("_type", "json")
                .build(true)
                .toUri();
    }


}
