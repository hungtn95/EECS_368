public class MakeAccount1PA extends MakeAccount1P {
	private int call_the_cop = 0;
	public MakeAccount1PA(double balance, String password) {
		super(balance, password);
	}
	public void view(String password) {
		if (password != this.getPassword()) {
			if (call_the_cop >= 7) {
				System.out.println("Cops Called");
			} else {
				System.out.println("Incorrect Password");
				call_the_cop ++;
			}
		} else {
			super.view();	
		}
	}
	public void deposit(String password, double fund) {
		if (password != this.getPassword()) {
			if (call_the_cop >= 7) {
				System.out.println("Cops Called");
			} else {
				System.out.println("Incorrect Password");
				call_the_cop ++;
			}
		} else {
			super.deposit(fund);
		}
	}
	public void withdraw(String password, double fund) {
		if (password != this.getPassword()) {
			if (call_the_cop >= 7) {
				System.out.println("Cops Called");
			} else {
				System.out.println("Incorrect Password");
				call_the_cop ++;
			}
		} else {
			super.withdraw(fund);
		}
	}
	public void show(String password) {
		if (password != this.getPassword()) {
			if (call_the_cop >= 7) {
				System.out.println("Cops Called");
			} else {
				System.out.println("Incorrect Password");
				call_the_cop ++;
			}
		} else {
			super.show();
		}
	} 
}
