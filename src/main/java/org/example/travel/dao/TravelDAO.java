package org.example.travel.dao;

import org.example.travel.vo.TravelVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TravelDAO {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public TravelDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<TravelVO> allTravels() {
        String sql = "select no, district, title, description, address, phone from travel";

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(TravelVO.class));
    }

    public List<TravelVO> searchTravels(String district) {
        String sql = "select no, district, title, description, address, phone from travel where district = ?";

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(TravelVO.class), district);
    }

    public List<TravelVO> searchTravels(String district, String search) {
        String sql = "select no, district, title, description, address, phone from travel where district = ? and title like ?";

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(TravelVO.class), district, "%" + search + "%");
    }
}
