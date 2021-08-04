package com.bean;

public class UserAdmin {
    private Integer id;

    private String adNo;

    private String adName;

    private String adPwd;

    private String adSex;

    private String adAge;

    private String adType;

    private String attr1;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdNo() {
        return adNo;
    }

    public void setAdNo(String adNo) {
        this.adNo = adNo == null ? null : adNo.trim();
    }

    public String getAdName() {
        return adName;
    }

    public void setAdName(String adName) {
        this.adName = adName == null ? null : adName.trim();
    }

    public String getAdPwd() {
        return adPwd;
    }

    public void setAdPwd(String adPwd) {
        this.adPwd = adPwd == null ? null : adPwd.trim();
    }

    public String getAdSex() {
        return adSex;
    }

    public void setAdSex(String adSex) {
        this.adSex = adSex == null ? null : adSex.trim();
    }

    public String getAdAge() {
        return adAge;
    }

    public void setAdAge(String adAge) {
        this.adAge = adAge == null ? null : adAge.trim();
    }

    public String getAdType() {
        return adType;
    }

    public void setAdType(String adType) {
        this.adType = adType == null ? null : adType.trim();
    }

    public String getAttr1() {
        return attr1;
    }

    public void setAttr1(String attr1) {
        this.attr1 = attr1 == null ? null : attr1.trim();
    }

    @Override
    public String toString() {
        return "UserAdmin{" +
                "id=" + id +
                ", adNo='" + adNo + '\'' +
                ", adName='" + adName + '\'' +
                ", adPwd='" + adPwd + '\'' +
                ", adSex='" + adSex + '\'' +
                ", adAge='" + adAge + '\'' +
                ", adType='" + adType + '\'' +
                ", attr1='" + attr1 + '\'' +
                '}';
    }
}