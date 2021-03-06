package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@NamedQueries({
	@NamedQuery(name="findCustomerByEmailandPassword",
			query="SELECT c " +
					"FROM  Customer c " +
					"WHERE c.Email = :email AND " +
			"      c.Password = :password"),
			@NamedQuery(name = "GetAllCustomers",
			query= "SELECT c FROM Customer c"),   
			@NamedQuery(name = "GetPasswordForEmail",
			query = "SELECT c FROM Customer c where c.Email = :email"),
	})
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)		
	private int CustomerId;
	private String Name;
	@Temporal(TemporalType.DATE)
	private Date Dob;
	private String Email;
	private String Password;
	private String LicenseNo;
	private int RoleId;
	
	public int getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public Date getDob() {
		return Dob;
	}
	public Customer(int customerId, String name, Date dob, String email,
			String password, String licenseNo, int roleId) {
		super();
		CustomerId = customerId;
		Name = name;
		Dob = dob;
		Email = email;
		Password = password;
		LicenseNo = licenseNo;
		RoleId = roleId;
	}
	public void setDob(Date dob) {
		Dob = dob;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getLicenseNo() {
		return LicenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		LicenseNo = licenseNo;
	}
	public Customer(int customerId, String name, Date dob, String email,
			String password, String licenseNo) {
		super();
		CustomerId = customerId;
		Name = name;
		Dob = dob;
		Email = email;
		Password = password;
		LicenseNo = licenseNo;
	}
	public Customer() {
		super();
	}
	public Customer(String name, Date dob, String email, String password,
			String licenseNo) {
		super();
		Name = name;
		Dob = dob;
		Email = email;
		Password = password;
		LicenseNo = licenseNo;
	}

	public Customer(String name, Date dob, String email, String password,
			String licenseNo, int roleId) {
		super();
		Name = name;
		Dob = dob;
		Email = email;
		Password = password;
		LicenseNo = licenseNo;
		RoleId = roleId;
	}
	public int getRoleId() {
		return RoleId;
	}
	public void setRoleId(int roleId) {
		RoleId = roleId;
	}	

}
