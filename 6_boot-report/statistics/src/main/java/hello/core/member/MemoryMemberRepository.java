package hello.core.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
//ȸ����¥����� 
@Component//���� �� ��� ���ϰ� ��� �ϳ��� �ٿ��ָ� �˴ϴ�.
public class MemoryMemberRepository implements MemberRepository {

	//ȸ����¥����ҿ����� ��밡���� static�� HashMap(Ű�� �ߺ��� ����, ���� �ߺ� ���) - ȸ�� ����, ȸ�� ID�� ã�� �޼��� 
	private static Map<Long, Member> store = new HashMap<>(); //�ǹ������� concurrentHashMap ����Ѵ� - ���ü� �̽��� �� ���� ���ֱ� ���� 
	
	@Override
	public void save(Member member) {
		store.put(member.getId(), member);
		
	}

	@Override
	public Member findById(Long memberId) {
		return store.get(memberId);
	}
	
	
}
