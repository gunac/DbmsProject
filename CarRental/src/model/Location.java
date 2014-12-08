package model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
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
