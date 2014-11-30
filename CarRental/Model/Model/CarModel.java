package Model;

public class CarModel {
	
	private int CarId;
	private String CarName;
	private String Seats;
	private int Count;
		
	public int getCarId() {
		return CarId;
	}
	public void setCarId(int carId) {
		CarId = carId;
	}
	public String getCarName() {
		return CarName;
	}
	public void setCarName(String carName) {
		CarName = carName;
	}
	public String getSeats() {
		return Seats;
	}
	public void setSeats(String seats) {
		Seats = seats;
	}	
	public int getCount() {
		return Count;
	}
	public void setCount(int count) {
		Count = count;
	}
	public CarModel() {
		super();
	}
	public CarModel(int carId, String carName, String seats) {
		super();
		CarId = carId;
		CarName = carName;
		Seats = seats;
	}
	public CarModel(String carName, String seats) {
		super();
		CarName = carName;
		Seats = seats;
	}
}
