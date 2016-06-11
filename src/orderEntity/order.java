package orderEntity;

public class order {
	private String username;
	private String pid;
	private String  ownername;
	private int pnum;

	
	public order() {
		super();
	}

	public order(String userName, String pID, String ownerName, int pNUM) {
		super();
		this.username = userName;
		this.pid = pID;
		this.ownername = ownerName;
		this.pnum= pNUM;
	}

	public String getUserName() {
		return username;
	}

	public void setUserID(String usrName) {
		this.username = usrName;
	}

	public String getPID() {
		return pid;
	}

	public void setPID(String pID) {
		this.pid = pID;
	}

	public String getOwnerName() {
		return ownername;
	}

	public void setOwnerName(String OwnerName) {
		this.ownername = OwnerName;
	}

	public int getpNUM() {
		return pnum;
	}

	public void setpNUM(int pNUM) {
		this.pnum = pNUM;
	}
	
}
