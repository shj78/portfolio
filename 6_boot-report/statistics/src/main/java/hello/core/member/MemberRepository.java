package hello.core.member;

//ȸ��������������̽� 
public interface MemberRepository {
	
	void save(Member member);
	Member findById(Long memberId);
}
