package com.bean;

public class TeaCourse {
    private String cName;
    private String tName;
    private String cTerm;
    private String cType;
    private String cHours;
    private String cCredit;
    private String tId;
    private String cNo;

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public String getcTerm() {
        return cTerm;
    }

    public void setcTerm(String cTerm) {
        this.cTerm = cTerm;
    }

    public String getcType() {
        return cType;
    }

    public void setcType(String cType) {
        this.cType = cType;
    }

    public String getcHours() {
        return cHours;
    }

    public void setcHours(String cHours) {
        this.cHours = cHours;
    }

    public String getcCredit() {
        return cCredit;
    }

    public void setcCredit(String cCredit) {
        this.cCredit = cCredit;
    }

    public String gettId() {
        return tId;
    }

    public void settId(String tId) {
        this.tId = tId;
    }

    public String getcNo() {
        return cNo;
    }

    public void setcNo(String cNo) {
        this.cNo = cNo;
    }

    @Override
    public String toString() {
        return "TeaCourse{" +
                "cName='" + cName + '\'' +
                ", tName='" + tName + '\'' +
                ", cTerm='" + cTerm + '\'' +
                ", cType='" + cType + '\'' +
                ", cHours='" + cHours + '\'' +
                ", cCredit='" + cCredit + '\'' +
                ", tId='" + tId + '\'' +
                ", cNo='" + cNo + '\'' +
                '}';
    }
}
