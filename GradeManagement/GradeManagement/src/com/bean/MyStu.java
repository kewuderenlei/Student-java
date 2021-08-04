package com.bean;

public class MyStu {
    private String name;

    private String uid;

    private String cName;

    private String cTerm;

    private String teaId;

    private String teaName;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public String getcTerm() {
        return cTerm;
    }

    public void setcTerm(String cTerm) {
        this.cTerm = cTerm == null ? null : cTerm.trim();
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

    @Override
    public String toString() {
        return "MyStu{" +
                "name='" + name + '\'' +
                ", uid='" + uid + '\'' +
                ", cName='" + cName + '\'' +
                ", cTerm='" + cTerm + '\'' +
                ", teaId='" + teaId + '\'' +
                ", teaName='" + teaName + '\'' +
                '}';
    }
}