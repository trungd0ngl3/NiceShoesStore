package model;

public class Address {
	 private int addressId;

	    private String address;
	    private String city;
	    private String state;
	    private String zipcode;
	    private String country;

	    // Getters and Setters
	    public int getAddressId() {
	        return addressId;
	    }

	    public void setAddressId(int addressId) {
	        this.addressId = addressId;
	    }

	    public String getAddress() {
	        return address;
	    }

	    public void setAddress(String address) {
	        this.address = address;
	    }

	    public String getCity() {
	        return city;
	    }

	    public void setCity(String city) {
	        this.city = city;
	    }

	    public String getState() {
	        return state;
	    }

	    public void setState(String state) {
	        this.state = state;
	    }

	    public String getZipcode() {
	        return zipcode;
	    }

	    public void setZipcode(String zipcode) {
	        this.zipcode = zipcode;
	    }

	    public String getCountry() {
	        return country;
	    }

	    public void setCountry(String country) {
	        this.country = country;
	    }
}
