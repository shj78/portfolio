package hello.core.member;

//ȸ�� Ŭ���� - �ĺ���ȣ, �̸�, ���� 
public class Member {
	private Long id;
	private String name;
	private Grade grade;
	
	//MemberŬ���� ������ 
	public Member(Long id, String name, Grade grade) {
		this.id = id;
		this.name = name;
		this.grade = grade;
	}
	//getter/setter
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	
	
	
	
	
	
	
	
	
}