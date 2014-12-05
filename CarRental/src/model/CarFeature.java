package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class CarFeature {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	 
	private int FeatureId;
	private String Description;
	
	public int getFeatureId() {
		return FeatureId;
	}
	public void setFeatureId(int featureId) {
		FeatureId = featureId;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public CarFeature() {
		super();
	}
	public CarFeature(int featureId, String description) {
		super();
		FeatureId = featureId;
		Description = description;
	}	
	public CarFeature(String description) {
		super();
		Description = description;
	}
}
