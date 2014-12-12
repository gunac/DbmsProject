package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
	@NamedQuery(name = "GetAllLocation", query = "SELECT l FROM Location l")})

public class Location {
@Id
private String Name;


public String getName() {
return Name;
}

public void setName(String name) {
Name = name;
}

public Location(String name) {
super();
Name = name;
}

public Location() {
super();
}


}
