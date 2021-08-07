package com.bean;

public class Position {
    private Integer id;

    private String pId;

    private String pName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId == null ? null : pId.trim();
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    @Override
    public String toString() {
        return "Position{" +
                "id=" + id +
                ", pId='" + pId + '\'' +
                ", pName='" + pName + '\'' +
                '}';
    }
}