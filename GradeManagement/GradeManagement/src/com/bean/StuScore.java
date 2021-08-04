package com.bean;

public class StuScore {
    private String sNo;
    private String sName;
    private String tNo;
    private String tName;
    private String cNo;
    private String cName;
    private String teaId;
    private String teaName;
    private String cHours;
    private String cCredit;
    private String cType;
    private String score;
    private String claName;

    public String getsNo() {
        return sNo;
    }

    public void setsNo(String sNo) {
        this.sNo = sNo;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName;
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

    public String getcType() {
        return cType;
    }

    public void setcType(String cType) {
        this.cType = cType;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getTeaId() {
        return teaId;
    }

    public void setTeaId(String teaId) {
        this.teaId = teaId;
    }

    public String gettNo() {
        return tNo;
    }

    public void settNo(String tNo) {
        this.tNo = tNo;
    }

    public String getcNo() {
        return cNo;
    }

    public void setcNo(String cNo) {
        this.cNo = cNo;
    }

    public String getClaName() {
        return claName;
    }

    public void setClaName(String claName) {
        this.claName = claName;
    }

    @Override
    public String toString() {
        return "StuScore{" +
                "sNo='" + sNo + '\'' +
                ", tName='" + tName + '\'' +
                ", cName='" + cName + '\'' +
                ", teaName='" + teaName + '\'' +
                ", cHours='" + cHours + '\'' +
                ", cCredit='" + cCredit + '\'' +
                ", cType='" + cType + '\'' +
                ", score='" + score + '\'' +
                ", sName='" + sName + '\'' +
                ", teaId='" + teaId + '\'' +
                ", cNo='" + cNo + '\'' +
                ", tNo='" + tNo + '\'' +
                ", claName='" + claName + '\'' +
                '}';
    }
}
