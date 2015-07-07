package xmlquestion;

public class XMLCountry {
    
    private String name;
    private String lattitude;
    private String longitude;
    private String nameWithUnderlines;
    

	public XMLCountry(String name, String lattitude, String longitude){
        this.setName(name);
        this.setLattitude(lattitude);
        this.setLongitude(longitude);
    }
    
    public XMLCountry(String name){
        this.setName(name);
        this.setLattitude("");
        this.setLongitude("");
    }
    
    public XMLCountry(String lattitude, String longitude){
        this.setName("");
        this.setLattitude(lattitude);
        this.setLongitude(longitude);
    }

    public String getName() {
    	if (name.contains("%C3%A7")){
    		name = name.replace("%C3%A7", "c");
    	}
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLattitude() {
        return lattitude;
    }

    public void setLattitude(String lattitude) {
        this.lattitude = lattitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }
    
    public String getNameWithUnderlines() {
		return name.replace(" ", "_");
	}

	public void setNameWithUnderlines(String nameWithUnderlines) {
		this.nameWithUnderlines = nameWithUnderlines;
	}
    
    
    @Override
    public String toString(){
        String ret = "Country name: " + this.getName() + "\n"
                + "Lattitude: " + this.getLattitude() + "\n"
                + "Longitude: " + this.getLongitude() + "\n";
        
        return ret;
    }
    
}
