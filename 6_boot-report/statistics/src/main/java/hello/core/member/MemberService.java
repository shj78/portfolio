package hello.core.member;

//ȸ�� ���� ���� �������̽� - ���� �޼���, ��� ã�� �޼���
public interface MemberService {
	
	void  join(Member member);
	Member findMember(Long memberId);
}
