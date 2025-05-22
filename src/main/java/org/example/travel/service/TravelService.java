package org.example.travel.service;

import org.example.travel.dao.TravelDAO;
import org.example.travel.dto.PageListDTO;
import org.example.travel.vo.TravelVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TravelService {

    private final TravelDAO travelDAO;

    @Autowired
    public TravelService(TravelDAO travelDAO) {
        this.travelDAO = travelDAO;
    }

    public int countSearchResults(List<TravelVO> travels) {
        return travels.size();
    }

    public PageListDTO allTravels(int page) {
        return travelDAO.allTravels(page);
    }

    public List<TravelVO> allTravelsByDistrict(String district) {
        return travelDAO.searchTravels(district);
    }

    public List<TravelVO> allTravelsByDistrictAndTitle(String district, String title) {
        return travelDAO.searchTravels(district, title);
    }
}
