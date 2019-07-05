package yht.framework.util;

import org.springframework.context.support.MessageSourceAccessor;

public class Prop {
	private static MessageSourceAccessor messageSourceAccessor;
	
	public void setMessageSourceAccessor(MessageSourceAccessor messageSourceAccessor){
		this.messageSourceAccessor = messageSourceAccessor;
	}
	
	public static String getMessage(String key){
		String msg = null;
		
		try{
			msg = messageSourceAccessor.getMessage(key);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return msg;
	}
}
