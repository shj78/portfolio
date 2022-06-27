package hello.core.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//회원진짜서비스 클래스 
@Component
public class MemberServiceImpl implements MemberService {

	//DIP 위반 - MemberServiceImpl은 MemberRepository와 MemoryMemberRepository에 의존적 - 얘네 문제생기면 바로 문제!? 
	
	//private final MemberRepository memberRepository = new MemoryMemberRepository();
	private final MemberRepository memberRepository;
	
	
	//생성자를 통해서 memberRepository 인터페이스가 정의되고, 이 MemberServiceImpl가 생성자 주입되어있고, 추상화에 의존하며 DIP지키는 중 
	@Autowired //자동으로 의존관계 주입을 해주는 이거를 꼭 해줘야함! 
	public MemberServiceImpl(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	@Override
	public void join(Member member) {
		memberRepository.save(member);
	}

	@Override
	public Member findMember(Long memberId) {
		return memberRepository.findById(memberId);
	}
	
	//테스트 용도
	public MemberRepository getMemberRepository() {
		return memberRepository;
	}
	
	
		
}
