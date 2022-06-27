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

	//�޸� ���
	//private final MemberRepository memberRepository = new MemoryMemberRepository();
	private final MemberRepository memberRepository;
	
	//�������� ��å 
	//private final DiscountPolicy discountPolicy = new FixDiscountPolicy();
	//private final DiscountPolicy discountPolicy = new RateDiscountPolicy();//�� ��ü�� OCP ����
	//OCP�� �������� ��������
	private final DiscountPolicy discountPolicy;
	//DIP�� ��Ű�� ������Ʈ�� ���!
	//���: ���� discountPolicy��� ��ü�� �������־���Ѵ�. �������־�� �Ѵ�. 
	
	@Autowired //�������� ����
	public OrderServiceImpl(MemberRepository memberRepository, DiscountPolicy discountPolicy) {
		this.memberRepository = memberRepository;
		this.discountPolicy = discountPolicy;
	}
	//�� ���̻� OrderServiceImpl�� FixDiscountPolicy�� �������� �ʴ´�!
	//���� �������̽����� �����Ѵ�.
	//OrderServiceImpl�� �����ڷ� � ���� ������ ���� ���� AppConfig���� �����Ѵ�.
	//���� ��� ���ุ �����Ѵ�. 

	
	@Override
	public Order createOrder(Long memberId, String itemName, int itemPrice) {
		Member member = memberRepository.findById(memberId);
		int discountPrice = discountPolicy.discount(member, itemPrice);
		//�� �� ���� �� OrderService ���忡���� "���� ���� ��å�� �𸣰ڰ�! discountPolicy �ϰ� �˾Ƽ� ����" 
		//�� ���� å�� ��Ģ�� �� �������ִ� ��!
		
		//�ֹ��� ����� ��ȯ
		return new Order(memberId, itemName, itemPrice, discountPrice);
	}
	
	public MemberRepository getMemberRepository() {
		return memberRepository;
	}
}
