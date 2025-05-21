package org.example.travel.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TravelVO {
    private int no;
    private String district;
    private String title;
    private String description;
    private String address;
    private String phone;

    public String getDescription() {
        if (description == null) return "";

        String[] words = description.split("\\.\\s*");

        StringBuilder sb = new StringBuilder();

        for (String word : words) {
            if (!word.trim().isEmpty()) {
                sb.append(word.trim()).append(".\n");
            }
        }

        return sb.toString();
    }
}
