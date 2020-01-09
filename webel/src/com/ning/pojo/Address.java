package com.ning.pojo;

import java.util.Objects;

public class Address {
    private String pre;
    private String city;
    private String town;

    public String getPre() {
        return pre;
    }

    public void setPre(String pre) {
        this.pre = pre;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    @Override
    public String toString() {
        return "Address{" +
                "pre='" + pre + '\'' +
                ", city='" + city + '\'' +
                ", town='" + town + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (!(object instanceof Address)) return false;
        Address address = (Address) object;
        return Objects.equals(pre, address.pre) &&
                Objects.equals(city, address.city) &&
                Objects.equals(town, address.town);
    }

    @Override
    public int hashCode() {

        return Objects.hash(pre, city, town);
    }

    public Address(String pre, String city, String town) {
        this.pre = pre;
        this.city = city;
        this.town = town;
    }

    public Address() {
    }
}
