package hello.core;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import hello.core.discount.DiscountPolicy;
import hello.core.discount.FixDiscountPolicy;
import hello.core.discount.RateDiscountPolicy;
import hello.core.member.MemberRepository;
import hello.core.member.MemberService;
import hello.core.member.MemberServiceImpl;
import hello.core.member.MemoryMemberRepository;
import hello.core.order.OrderService;
import hello.core.order.OrderServiceImpl;

//app ��ü�� �����ϰ� �����Ѵ�. 
//��� ��찡 �ٸ� ��츦 �����ϰ� ���� �ʰ� AppConfig���� �� �ϰ� �Ѵ�. 
//AppConfig�� ���ø����̼��� ���� ���ۿ� �ʿ��� ������ü�� �����Ѵ�. -> ���� ���� new �ϰ� �ϴ��� �� �����.
//AppConfig�� ������ ��ü �ν��Ͻ��� ������ �����ڸ� ���ؼ� �������ش�.

//������ȹ�� - ��������� ��� ��ȹ�ڿ��� �ð�! 
@Configuration//���������� ������ 1----------- // @Configuration�� �̱����� ���ؼ� �����Ѵ�.  
public class AppConfig {
	
	//������ ���
	//call AppConfig.memberService
	//call AppConfig.memberRepository
	//call AppConfig.memberRepository
	//call AppConfig.orderService
	//call AppConfig.memberRepository
	
	//���� ���
	//call AppConfig.memberService
	//call AppConfig.memberRepository
	//call AppConfig.orderService
	
	@Bean//���������� ������ 2-----------�� �޼��忡 Bean�̶�� �����ָ� �� �޼������ �����������̳ʿ� ����� �� (k:�޼����̸�, v:�޼��� ����)
	public MemberService memberService() {
		System.out.println("call AppConfig.memberService");
		//return new MemberServiceImpl(new MemoryMemberRepository());//������ ���� - �������� ���� 
		return new MemberServiceImpl(memberRepository());//������ �Ʒ���!!! - ��
		//MemberServiceImpl���忡���� �� �ָӴϿ� ���� �� ���ڱ� �����ִ� �� ���� ���� ���踦 ���� �����ߴٰ� �ؼ� DI
	}
	
	@Bean
	public MemberRepository memberRepository() {
		System.out.println("call AppConfig.memberRepository");
		return new MemoryMemberRepository();
	}
	
	@Bean
	public OrderService orderService() {
		//�����ڸ� �ΰ��� ���� OrderServiceImpl�� MemoryMemberRepository�� FixDiscountPolicy�� �����ϴ� �׸��� �׸� 
		//�׸��� �ϼ��Ǹ� �� OrderServiceImpl�� ��ȯ 
		System.out.println("call AppConfig.orderService");
		return new OrderServiceImpl(memberRepository(), discountPolicy());//��ü �������� ȣ���!!! - �� �ϴϱ� ���� �ٸ� ��ü���� �͵��� �� ��ü�� 
	}
	
	@Bean
	public DiscountPolicy discountPolicy() {
		//return new FixDiscountPolicy();
		return new RateDiscountPolicy();
	}
}
