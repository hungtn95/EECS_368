public class MakeAccount1 extends MakeAccount {
	private String ledger;
	public MakeAccount1(double balance) {
		super(balance);
		ledger = "(start = " + getBalance() + " ) ";
	}
	public void deposit(double fund) {
		super.deposit(fund);
		ledger = ledger + "(+ " + fund + " = " + getBalance() + " ) ";
	}
	public void withdraw(double fund) {
		super.withdraw(fund);
		if (this.getBalance() >= 0) {
			ledger = ledger + "(- " + fund + " = " + getBalance() + " ) ";
		}
	}
	public void view(){
		super.view();
	}
	public void show() {
		System.out.println("Ledger:" + "'(" + ledger + ")");
	}
}
