package com.bean;

public class UserTea {
    private Integer id;

    private String teaId;

    private String teaName;

    private String teaSex;

    private String teaAge;

    private String teaSet;

    private String teaPhone;

    private String type;

    private String head;

    private String pwd;

    private String attr1;

    private String attr2;

    private String attr3;

    private String attr4;

    private String attr5;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTeaId() {
        return teaId;
    }

    public void setTeaId(String teaId) {
        this.teaId = teaId == null ? null : teaId.trim();
    }

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName == null ? null : teaName.trim();
    }

    public String getTeaSex() {
        return teaSex;
    }

    public void setTeaSex(String teaSex) {
        this.teaSex = teaSex == null ? null : teaSex.trim();
    }

    public String getTeaAge() {
        return teaAge;
    }

    public void setTeaAge(String teaAge) {
        this.teaAge = teaAge == null ? null : teaAge.trim();
    }

    public String getTeaSet() {
        return teaSet;
    }

    public void setTeaSet(String teaSet) {
        this.teaSet = teaSet == null ? null : teaSet.trim();
    }

    public String getTeaPhone() {
        return teaPhone;
    }

    public void setTeaPhone(String teaPhone) {
        this.teaPhone = teaPhone == null ? null : teaPhone.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head == null ? null : head.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
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

    public String getAttr4() {
        return attr4;
    }

    public void setAttr4(String attr4) {
        this.attr4 = attr4 == null ? null : attr4.trim();
    }

    public String getAttr5() {
        return attr5;
    }

    public void setAttr5(String attr5) {
        this.attr5 = attr5 == null ? null : attr5.trim();
    }

    @Override
    public String toString() {
        return "UserTea{" +
                "id=" + id +
                ", teaId='" + teaId + '\'' +
                ", teaName='" + teaName + '\'' +
                ", teaSex='" + teaSex + '\'' +
                ", teaAge='" + teaAge + '\'' +
                ", teaSet='" + teaSet + '\'' +
                ", teaPhone='" + teaPhone + '\'' +
                ", type='" + type + '\'' +
                ", head='" + head + '\'' +
                ", pwd='" + pwd + '\'' +
                ", attr1='" + attr1 + '\'' +
                ", attr2='" + attr2 + '\'' +
                ", attr3='" + attr3 + '\'' +
                ", attr4='" + attr4 + '\'' +
                ", attr5='" + attr5 + '\'' +
                '}';
    }
}