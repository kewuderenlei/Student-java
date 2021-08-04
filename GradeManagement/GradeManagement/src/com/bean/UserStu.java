package com.bean;

public class UserStu {
    private Integer id;

    private String uid;

    private String name;

    private String claName;

    private String collName;

    private String sex;

    private String head;

    private String pwd;

    private String type;

    private String age;

    private String address;

    private String credit;

    private String attr1;

    public UserStu() {
    }

    public UserStu(String uid, String name, String claName, String collName, String sex, String head, String pwd, String type, String age, String address, String credit) {
        this.uid = uid;
        this.name = name;
        this.claName = claName;
        this.collName = collName;
        this.sex = sex;
        this.head = head;
        this.pwd = pwd;
        this.type = type;
        this.age = age;
        this.address = address;
        this.credit = credit;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getClaName() {
        return claName;
    }

    public void setClaName(String claName) {
        this.claName = claName == null ? null : claName.trim();
    }

    public String getCollName() {
        return collName;
    }

    public void setCollName(String collName) {
        this.collName = collName == null ? null : collName.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age == null ? null : age.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit == null ? null : credit.trim();
    }

    public String getAttr1() {
        return attr1;
    }

    public void setAttr1(String attr1) {
        this.attr1 = attr1 == null ? null : attr1.trim();
    }

    @Override
    public String toString() {
        return "UserStu{" +
                "id=" + id +
                ", uid='" + uid + '\'' +
                ", name='" + name + '\'' +
                ", claName='" + claName + '\'' +
                ", collName='" + collName + '\'' +
                ", sex='" + sex + '\'' +
                ", head='" + head + '\'' +
                ", pwd='" + pwd + '\'' +
                ", type='" + type + '\'' +
                ", age='" + age + '\'' +
                ", address='" + address + '\'' +
                ", credit='" + credit + '\'' +
                ", attr1='" + attr1 + '\'' +
                '}';
    }
}