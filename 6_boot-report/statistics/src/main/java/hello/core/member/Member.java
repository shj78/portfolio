package hello.core.member;

//회원 클래스 - 식별번호, 이름, 수준 
public class Member {
	private Long id;
	private String name;
	private Grade grade;
	
	//Member클래스 생성자 
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
