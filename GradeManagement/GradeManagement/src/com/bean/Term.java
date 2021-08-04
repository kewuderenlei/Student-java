package com.bean;

public class Term {
    private Integer id;

    private String tNo;

    private String tName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String gettNo() {
        return tNo;
    }

    public void settNo(String tNo) {
        this.tNo = tNo == null ? null : tNo.trim();
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName == null ? null : tName.trim();
    }

    @Override
    public String toString() {
        return "Term{" +
                "id=" + id +
                ", tNo='" + tNo + '\'' +
                ", tName='" + tName + '\'' +
                '}';
    }
}