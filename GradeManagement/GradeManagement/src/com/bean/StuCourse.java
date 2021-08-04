package com.bean;

public class StuCourse {
    private Integer id;
    private String sNo;
    private String cNo;
    private String cStatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getsNo() {
        return sNo;
    }

    public void setsNo(String sNo) {
        this.sNo = sNo;
    }

    public String getcNo() {
        return cNo;
    }

    public void setcNo(String cNo) {
        this.cNo = cNo;
    }

    public String getcStatus() {
        return cStatus;
    }

    public void setcStatus(String cStatus) {
        this.cStatus = cStatus;
    }

    @Override
    public String toString() {
        return "StuCourse{" +
                "id=" + id +
                ", sNo='" + sNo + '\'' +
                ", cNo='" + cNo + '\'' +
                ", cStatus='" + cStatus + '\'' +
                '}';
    }
}
