public class MakeAccount1P extends MakeAccount1 { 
	private String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public MakeAccount1P(double balance, String password) {
		super(balance);
		this.password = password;
	}
	public void view(String password) {
		if (password == this.password) {
			view();
		} else {
			System.out.println("Incorrect Password");
		}
	}
	public void deposit(String password, double fund) {
		if (password == this.password) {
			deposit(fund);
		} else {
			System.out.println("Incorrect Password");
		}
	}
	public void withdraw(String password, double fund) {
		if (password == this.password) {
			withdraw(fund);
		} else {
			System.out.println("Incorrect Password");
		}
	}
	public void show(String password) {
		if (password == this.password) {
			show();
		} else {
			System.out.println("Incorrect Password");
		}
	}
}
