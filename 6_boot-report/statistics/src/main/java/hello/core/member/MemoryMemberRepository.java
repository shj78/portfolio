package hello.core.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
//회원진짜저장소 
@Component//이제 빈 등록 안하고 요거 하나만 붙여주면 됩니다.
public class MemoryMemberRepository implements MemberRepository {

	//회원진짜저장소에서만 사용가능한 static형 HashMap(키는 중복을 불허, 값은 중복 허용) - 회원 저장, 회원 ID로 찾기 메서드 
	private static Map<Long, Member> store = new HashMap<>(); //실무에서는 concurrentHashMap 써야한다 - 동시성 이슈가 발 생할 수있기 때문 
	
	@Override
	public void save(Member member) {
		store.put(member.getId(), member);
		
	}

	@Override
	public Member findById(Long memberId) {
		return store.get(memberId);
	}
	
	
}
