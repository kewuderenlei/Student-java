package com.bean;

public class Class {
    private Integer id;

    private String claId;

    private String claName;

    private String attr1;

    private String attr2;

    private String attr3;

    public Class() {
    }

    public Class(String claId, String claName) {
        this.claId = claId;
        this.claName = claName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClaId() {
        return claId;
    }

    public void setClaId(String claId) {
        this.claId = claId == null ? null : claId.trim();
    }

    public String getClaName() {
        return claName;
    }

    public void setClaName(String claName) {
        this.claName = claName == null ? null : claName.trim();
    }

    public String getAttr1() {
        return attr1;
    }

    public void setAttr1(String attr1) {
        this.attr1 = attr1 == null ? null : attr1.trim();
    }

    public String getAttr2() {
        return attr2;
    }

    public void setAttr2(String attr2) {
        this.attr2 = attr2 == null ? null : attr2.trim();
    }

    public String getAttr3() {
        return attr3;
    }

    public void setAttr3(String attr3) {
        this.attr3 = attr3 == null ? null : attr3.trim();
    }

    @Override
    public String toString() {
        return "Class{" +
                "id=" + id +
                ", claId='" + claId + '\'' +
                ", claName='" + claName + '\'' +
                ", attr1='" + attr1 + '\'' +
                ", attr2='" + attr2 + '\'' +
                ", attr3='" + attr3 + '\'' +
                '}';
    }
}