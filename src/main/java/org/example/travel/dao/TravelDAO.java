package org.example.travel.dao;

import org.example.travel.dto.PageListDTO;
import org.example.travel.vo.TravelVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TravelDAO {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public TravelDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public PageListDTO allTravels(int cpage) {
        PageListDTO listTO = new PageListDTO();
        listTO.setCpage(cpage);

        int recordPerPage = listTO.getRecordPerPage();
        int pagePerBlock = listTO.getPagePerBlock();

        // 전체 레코드 수 조회
        String countSql = "select count(*) from travel";
        int totalRecord = jdbcTemplate.queryForObject(countSql, Integer.class);
        listTO.setTotalRecord(totalRecord);

        // 전체 페이지 수 계산
        int totalPage = ((totalRecord - 1) / recordPerPage) + 1;
        listTO.setTotalPage(totalPage);

        // OFFSET과 LIMIT 계산
        int skip = (cpage - 1) * recordPerPage;
        String sql = "select no, district, title, description, address, phone from travel order by no desc limit ? offset ?";

        List<TravelVO> travelList = jdbcTemplate.query(
                sql,
                new BeanPropertyRowMapper<>(TravelVO.class),
                recordPerPage, skip
        );

        listTO.setTravelLists(new ArrayList<>(travelList));

        // 블록 계산
        listTO.setStartBlock(cpage - (cpage - 1) % pagePerBlock);
        listTO.setEndBlock(listTO.getStartBlock() + pagePerBlock - 1);
        if (listTO.getEndBlock() > totalPage) {
            listTO.setEndBlock(totalPage);
        }

        return listTO;
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
