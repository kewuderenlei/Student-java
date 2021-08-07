package com.bean;

public class Course {
    private Integer id;

    private String cNo;

    private String cName;

    private String cTeacher;

    private String cTeaName;

    private String cTerm;

    private String cHours;

    private String cType;

    private String cCredit;

    private String cStatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getcNo() {
        return cNo;
    }

    public void setcNo(String cNo) {
        this.cNo = cNo == null ? null : cNo.trim();
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public String getcTeacher() {
        return cTeacher;
    }

    public void setcTeacher(String cTeacher) {
        this.cTeacher = cTeacher == null ? null : cTeacher.trim();
    }

    public String getcTerm() {
        return cTerm;
    }

    public void setcTerm(String cTerm) {
        this.cTerm = cTerm == null ? null : cTerm.trim();
    }

    public String getcHours() {
        return cHours;
    }

    public void setcHours(String cHours) {
        this.cHours = cHours == null ? null : cHours.trim();
    }

    public String getcType() {
        return cType;
    }

    public void setcType(String cType) {
        this.cType = cType == null ? null : cType.trim();
    }

    public String getcCredit() {
        return cCredit;
    }

    public void setcCredit(String cCredit) {
        this.cCredit = cCredit == null ? null : cCredit.trim();
    }

    public String getcStatus() {
        return cStatus;
    }

    public void setcStatus(String cStatus) {
        this.cStatus = cStatus == null ? null : cStatus.trim();
    }

    public String getcTeaName() {
        return cTeaName;
    }

    public void setcTeaName(String cTeaName) {
        this.cTeaName = cTeaName;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", cNo='" + cNo + '\'' +
                ", cName='" + cName + '\'' +
                ", cTeacher='" + cTeacher + '\'' +
                ", cTerm='" + cTerm + '\'' +
                ", cHours='" + cHours + '\'' +
                ", cType='" + cType + '\'' +
                ", cCredit='" + cCredit + '\'' +
                ", cStatus='" + cStatus + '\'' +
                ", cTeaName='" + cTeaName + '\'' +
                '}';
    }
}