package exam_01_02.dto;

public class Sale {
	private int custNo;
	private String custName;
	private String grade;
	private int total;

	public Sale() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sale(int custNo, String custName, String grade, int total) {
		super();
		this.custNo = custNo;
		this.custName = custName;
		this.grade = grade;
		this.total = total;
	}

	public Sale(int custNo) {
		super();
		this.custNo = custNo;
	}

	@Override
	public String toString() {
		return String.format("Sale [custNo=%s, custName=%s, grade=%s, total=%s]", custNo, custName, grade, total);
	}

	public int getCustNo() {
		return custNo;
	}

	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
