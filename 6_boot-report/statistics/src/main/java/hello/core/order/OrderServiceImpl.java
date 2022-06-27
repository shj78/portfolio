package hello.core.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import hello.core.discount.DiscountPolicy;
import hello.core.discount.FixDiscountPolicy;
import hello.core.discount.RateDiscountPolicy;
import hello.core.member.Member;
import hello.core.member.MemberRepository;
import hello.core.member.MemoryMemberRepository;

@Component
public class OrderServiceImpl implements OrderService {

	//메모리 멤버
	//private final MemberRepository memberRepository = new MemoryMemberRepository();
	private final MemberRepository memberRepository;
	
	//고정할인 정책 
	//private final DiscountPolicy discountPolicy = new FixDiscountPolicy();
	//private final DiscountPolicy discountPolicy = new RateDiscountPolicy();//이 자체가 OCP 위반
	//OCP를 위반하지 않으려면
	private final DiscountPolicy discountPolicy;
	//DIP를 지키니 널포인트가 뜬다!
	//결론: 무언가 discountPolicy대신 객체를 생성해주어야한다. 주입해주어야 한다. 
	
	@Autowired //의존관계 주입
	public OrderServiceImpl(MemberRepository memberRepository, DiscountPolicy discountPolicy) {
		this.memberRepository = memberRepository;
		this.discountPolicy = discountPolicy;
	}
	//→ 더이상 OrderServiceImpl은 FixDiscountPolicy를 의존하지 않는다!
	//순수 인터페이스에만 의존한다.
	//OrderServiceImpl의 생성자로 어떤 것을 전달할 지는 이제 AppConfig에서 결정한다.
	//이제 얘는 실행만 집중한다. 

	
	@Override
	public Order createOrder(Long memberId, String itemName, int itemPrice) {
		Member member = memberRepository.findById(memberId);
		int discountPrice = discountPolicy.discount(member, itemPrice);
		//잘 된 설계 → OrderService 입장에서는 "나는 할인 정책은 모르겠고! discountPolicy 니가 알아서 해줘" 
		//라서 단일 책임 원칙이 잘 지켜져있는 것!
		
		//주문을 만들어 반환
		return new Order(memberId, itemName, itemPrice, discountPrice);
	}
	
	public MemberRepository getMemberRepository() {
		return memberRepository;
	}
}
