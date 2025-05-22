package org.example.travel.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.example.travel.vo.TravelVO;

import java.util.ArrayList;

@Getter
@Setter
@ToString
public class PageListDTO {
    private int cpage;
    private int recordPerPage;
    private int pagePerBlock;
    private int totalPage;
    private int totalRecord;
    private int startBlock;
    private int endBlock;

    private ArrayList<TravelVO> travelLists;

    public PageListDTO() {
        this.recordPerPage = 12;
        this.pagePerBlock = 10;
    }
}