package hello.core.member;

//회원 전용 서비스 인터페이스 - 가입 메서드, 멤버 찾기 메서드
public interface MemberService {
	
	void  join(Member member);
	Member findMember(Long memberId);
}
