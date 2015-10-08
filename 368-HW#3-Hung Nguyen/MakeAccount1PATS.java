public class MakeAccount1PATS extends MakeAccount1PAT {
	private double interest_rate;
	public MakeAccount1PATS(double balance, String password, double rate) {
		super(balance, password);
		interest_rate = rate;
	}
	public void interest(String password) {
		if (password == this.getPassword()) {
			this.setBalance(this.getBalance()*(1+interest_rate));
			System.out.println("Balance:" + this.getBalance());
		} else {
			System.out.println("Incorrect Password");
		}
	}
}
