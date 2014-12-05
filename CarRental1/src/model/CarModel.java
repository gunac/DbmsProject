package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class CarModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)	 
	private int ModelId;
	private CarType CarTypeCode;
	private String ModelName;
	private int Count;
	public int getModelId() {
		return ModelId;
	}
	public void setModelId(int modelId) {
		ModelId = modelId;
	}
	
	// creates a foreign key in Tower Table
		@ManyToOne()
		@JoinColumn(name="CarTypeCode")
	public CarType getCarTypeCode() {
		return CarTypeCode;
	}
	public void setCarTypeCode(CarType carTypeCode) {
		CarTypeCode = carTypeCode;
	}
	public String getModelName() {
		return ModelName;
	}
	public void setModelName(String modelName) {
		ModelName = modelName;
	}
	public int getCount() {
		return Count;
	}
	public void setCount(int count) {
		Count = count;
	}
	public CarModel(int modelId, CarType carTypeCode, String modelName, int count) {
		super();
		ModelId = modelId;
		CarTypeCode = carTypeCode;
		ModelName = modelName;
		Count = count;
	}
	public CarModel() {
		super();
	}
	public CarModel(CarType carTypeCode, String modelName, int count) {
		super();
		CarTypeCode = carTypeCode;
		ModelName = modelName;
		Count = count;
	}

	
}
