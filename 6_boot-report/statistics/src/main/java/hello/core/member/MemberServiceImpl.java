package hello.core.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//ȸ����¥���� Ŭ���� 
@Component
public class MemberServiceImpl implements MemberService {

	//DIP ���� - MemberServiceImpl�� MemberRepository�� MemoryMemberRepository�� ������ - ��� ��������� �ٷ� ����!? 
	
	//private final MemberRepository memberRepository = new MemoryMemberRepository();
	private final MemberRepository memberRepository;
	
	
	//�����ڸ� ���ؼ� memberRepository �������̽��� ���ǵǰ�, �� MemberServiceImpl�� ������ ���ԵǾ��ְ�, �߻�ȭ�� �����ϸ� DIP��Ű�� �� 
	@Autowired //�ڵ����� �������� ������ ���ִ� �̰Ÿ� �� �������! 
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
	
	//�׽�Ʈ �뵵
	public MemberRepository getMemberRepository() {
		return memberRepository;
	}
	
	
		
}
