public class MakeAccount {
	private double balance;
	public MakeAccount(double balance) {
		this.balance = balance;
	}
	public void setBalance(double fund) {
		balance = fund;
	}
	public double getBalance() {
		return balance;
	}
	public void deposit(double fund) {
		balance += fund;
		System.out.println("Balance:" + balance);
	}
	public void withdraw(double fund) {
		if (balance < fund) {
			System.out.println("Insufficient Funds");
		} else {
			balance -= fund;
			System.out.println("Balance:" + balance);
		}
	}
	public void view(){
		System.out.println("Balance:" + balance);
	}
}
