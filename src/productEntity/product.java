package productEntity;


public class product {
	private String pId;
	private String userid;
	private String pName;
	private String pTitle;
	private String pDisc;
	private int pPrice;
	private int clf;
	private String URL;
	private String city;
	private int number;
	public product() {
		super();
	}
	public product(String pid,String userid, String pname, String ptitle, String pdisc,
			int price,int CLF,String picture,String City,int num) {
		super();
		this.pId = pid;
		this.userid=userid;
		this.pName = pname;
		this.pTitle = ptitle;
		this.pDisc = pdisc;
		this.pPrice = price;
		this.clf=CLF;
		this.URL=picture;
		this.city=City;
		this.number=num;
	}
	public String getProductID() {
		return pId;
	}
	public String getuserID() {
		return userid;
	}

	public String getProductName() {
		return pName;
	}

	public void setProductName(String pname) {
		this.pName = pname;
	}

	public String getProductTitle() {
		return pTitle;
	}

	public void setpProductTitle(String ptitle) {
		this.pTitle = ptitle;
	}

	public String getDisc() {
		return pDisc;
	}

	public void setProductDisc(String pdisc) {
		this.pDisc = pdisc;
	}

	public int getPrice() {
		return pPrice;
	}

	public void setPrice(int pprice) {
		this.pPrice = pprice;
	}
	public int getNum() {
		return number;
	}

	public void setNum(int num) {
		this.number = num;
	}

	public int getClf() {
		return clf;
	}

	public void setClf(int Clf) {
		this.clf = Clf;
	}
	public void setURL(String Url){
		this.URL=Url;
	}
	public String getURL(){
		return URL;
	}
	public void setCity(String City){
		this.city=City;
	}
	public String getCity(){
		return city;
	}
}

