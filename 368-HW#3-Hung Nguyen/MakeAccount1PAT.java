public class MakeAccount1PAT extends MakeAccount1PA {
	public MakeAccount1PAT(double balance, String password) {
		super(balance, password);
	}
	public void transfer(String password1, MakeAccount1PAT acc2, String password2) {
		if (password1 == this.getPassword() && password2 == acc2.getPassword()) {
			double temp = this.getBalance();
			this.withdraw(temp);
			acc2.deposit(temp);
		} else {
			System.out.println("Incorrect Password");
		}
	}
}
