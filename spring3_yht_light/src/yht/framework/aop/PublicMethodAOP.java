package yht.framework.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.SourceLocation;

public class PublicMethodAOP {
	
	public Object trace(ProceedingJoinPoint joinPoint) throws Throwable{
//		String signatureString = joinPoint.getSignature().toShortString();
//		String signatureString2 = joinPoint.getSignature().toLongString();
//		String signatureString3 = joinPoint.getSignature().toString();
		
//		System.out.println(signatureString);
//		System.out.println(signatureString2);
//		System.out.println(signatureString3);
//		System.out.println("여기를 거쳐갑니다.");
		
		
		try{
			Object result = joinPoint.proceed();
			
			return result;
		}finally{
			
		}
	}
}