package org.yht.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class logAOP { //annotation 방식은 @Aspect를 해준다 메소드에 @around("within(패키지)")
	
	// 여러개 패키지 설정 가능 (맨마지막 패키지에는 class가 들어가있어야한다 ) , logger가 필요 없어진다 
	// 여러개 패키지를 설정하려면 or 로 이어서 해주면 된다 ! 
	
	@Around("within(org.yht.controller.*) or within(org.yht.dao.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable {
		 // 매개변수 joinpoint가 핵심
		String signatureStr = joinpoint.getSignature().toShortString();
		
		//System.out.println(signatureStr + "시작");
		
		try {
		System.out.println("loggerAOP:" + signatureStr + " 메소드가 실행되었습니다." );
		// 실행전 처리 ---------------------
		Object obj = joinpoint.proceed(); // 기능 실행 
		return obj;
		
		} finally {
			
			//System.out.println("실행후:" +  System.currentTimeMillis());
			
			//System.out.println(signatureStr + "종료");
		}
		
	}

}
