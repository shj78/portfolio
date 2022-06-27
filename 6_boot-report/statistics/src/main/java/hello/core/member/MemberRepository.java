package hello.core.member;

//회원저장소인터페이스 
public interface MemberRepository {
	
	void save(Member member);
	Member findById(Long memberId);
}
