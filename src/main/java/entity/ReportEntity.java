package entity;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class ReportEntity {

    private int id;
    private String username;
    private String report;
    public ReportEntity(String username,String report){
        this.username=username;
        this.report=report;
    }
}