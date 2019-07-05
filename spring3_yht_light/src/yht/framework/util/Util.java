package yht.framework.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.security.MessageDigest;
import java.util.Random;

import sun.misc.BASE64Encoder;

public class Util {
	/**
	 * null을 공백문자로 리턴
	 * @param src
	 * @return
	 */
	public static String null2str(String src){
		return (src == null) ? "" : src;
	}
	
	/**
	 * 서블릿에서 한국어 처리
	 * @param src
	 * @return
	 */
	public static String null2strKorean(String src){
		String reeturnString = "";
		
		try{
			reeturnString = new String(src.getBytes("Cp1252"), "EUC-KR");
		}catch(Exception e){
			reeturnString = src;
		}
		return (src == null) ? "" : reeturnString; 
	}
	
	/**
	 * 첫 알파벳을 대문자로 리턴
	 * @param src
	 * @return
	 */
	public static String getFirstUpperCase(String src){
		String returnString = "";
		
		if(src == null || src.trim().equals("")){
			return "";
		}else{
			returnString  = src;
			byte [] bytes = src.getBytes();
			
			if(bytes[0] > 96 && bytes[0] < 128){
				returnString = String.valueOf(src.charAt(0)).toUpperCase().concat(src.substring(1));
			}
		}
		
		return returnString;
	}
	

	/**
	 * column 명칭 등을 받아 set, get 메소드 명칭을 만든다.
	 * @param src
	 * @param div
	 * @return
	 */
	public static String getSetGetMethodName(String src, String div){
		String returnString = "";
		
		if(src == null || src.trim().equals("")){
			return "";
		}else{
			StringBuffer buf  = new StringBuffer();
			String[] srcArray = src.split("_");
			
			for(int i=0 ; i<srcArray.length ; i++){
				buf.append(getFirstUpperCase(srcArray[i].toLowerCase()));
			}
			
			if("set".equals(div)){
				returnString = "set" + buf.toString();
			}else if("get".equals(div)){
				returnString = "get" + buf.toString();
			}
		}
		
		return returnString;
	}

	/**
	 * column 명칭 등을 받아 '_'를 없애고 다음 문자를 대문자로 만들어 리턴 
	 * @param src
	 * @return
	 */
	public static String getToVarName(String src){
		String returnString = "";
		
		if(src == null || src.trim().equals("")){
			return "";
		}else{
			StringBuffer buf  = new StringBuffer();
			String[] srcArray = src.split("_");
			
			for(int i=0 ; i<srcArray.length ; i++){
				if(i == 0){
					buf.append(srcArray[i].toLowerCase());
				}else{
					buf.append(getFirstUpperCase(srcArray[i].toLowerCase()));
				}
			}
			
			returnString = buf.toString();
		}
		
		return returnString;
	}

    /**
     * 'null' 출력방지 및 문자열로 변환하여 반환
     */
    public static String print(Object o)
    {
        if(o == null)
            return "";
        StringBuffer sb = new StringBuffer(o.toString());
        for(int i = 0; i < sb.length(); i++)
        {
            char ch = sb.charAt(i);
            if(ch == '"')
            {
                sb.replace(i, i + 1, "&quot;");
                i += 5;
            }
            if(ch == '\'')
            {
                sb.replace(i, i + 1, "&#39;");
                i += 4;
            }
        }

        return sb.toString();
    }


    public static String printDateOnly(String o) {
        if (o == null) {
            return "";
        }else{
            return print(DateTime.date2strDateOnly(DateTime.str2dateDateOnly(o)));
        }
    }

    /**
     * 숫자(금액)를 #,##0 문자열로 변환하여 반환(단, 숫자는 Long Class type)
     */
    public static String money(Long n) {
        if (n == null) {
            return "";
        }

        return money(n.longValue());
    }

    /**
     * 금액표시 : 문자열(금액) 입력을 String type  #,##0 으로 반환  // CH02
     */
    public static String money(String n) {
        if (n == null) {
            return null;
        }
        n = n.trim();

        long m = 0l;
        try {
            m = Long.parseLong(n);
        }
        catch (Exception e) {
            //e.printStackTrace();
            return "";
        }
        return money(m);
    }
    
    
    /**
     * 매개변수로 들어온 8703041231313 주민등록번호를
     * 870304-1231313 문자열로 Return한다.
     */
    public static String ssnHyphen(String juminNo) {
        String jumin1, jumin2;

        if (juminNo.length() < 7) {
            return juminNo;
        }
        else {
            jumin1 = juminNo.substring(0, 6);
            jumin2 = juminNo.substring(6, juminNo.length());
        }
        return jumin1 + "-" + jumin2;
    }

    /**
     * 매개변수로 들어온 8703041231313 주민등록번호를
     * 870304-1****** 문자열로 Return한다.
     */
    public static String ssnAster(String juminNo) {
        StringBuffer sb = new StringBuffer(juminNo);
        for (int i = 7; i < juminNo.length() && juminNo.length() > 8; i++) {
            sb.replace(i, i + 1, "*");

        }
        return ssnHyphen(sb.toString());
    }

    /**
     * 매개변수로 들어온 문자열에서 '-'을 찾아 제거하고    //CH03
     * '-'이 없는 연결된 문자열을 Return한다.
     */
    public static String stripHyphen(String org) {

        for (; ; ) {
            int index = org.indexOf("-");

            if (index >= 0) {
                org = org.substring(0, index) + org.substring(index + 1);
            }
            else {
                break;
            }
        }
        return org;
    }

    public static String convertAmtToHanja(String ps_amt){

            String sArr_hanja[] = {"영", "壹", "貳", "參", "四", "五", "六", "七", "八", "九"};
            String sResult_hanja = "";
            String sAmt_hanja  = "";
            String sOne_num    = "";
            String sBack_amount= "";
            Float fCur_amount  = Float.valueOf(ps_amt);
            int   iAmt_length  = ps_amt.length();
            int   i = 0;

        for (i = iAmt_length; i > 0; i--) {
            int j = 0;
            j = i-1;
            sBack_amount = sBack_amount+ps_amt.charAt(j);
        }

        for (i=1; i <= iAmt_length ; i++) {
            int j = 0;
            j = i -1;
            sOne_num = "";
            sOne_num = sOne_num + sBack_amount.charAt(j);

            if ( sOne_num.equals("0") ) {
                sAmt_hanja = "";
            } else {
                Integer iTemp_hanja = null;
                sAmt_hanja = "";
                iTemp_hanja = Integer.valueOf(sOne_num);
                String sOne_hanja  = sArr_hanja[iTemp_hanja.intValue()];

                sAmt_hanja = sAmt_hanja + sOne_hanja;

                if ( (i == 4) || (i == 8) || (i == 12) ) {
                    sAmt_hanja = sAmt_hanja + "阡";
                } else if ( (i == 3) || (i == 7) || (i == 11) || (i == 15) ) {
                    sAmt_hanja = sAmt_hanja + "百";
                } else if ( (i == 2) || (i == 6) || (i == 10) || (i == 14) ) {
                    sAmt_hanja = sAmt_hanja + "拾";
                }
            }
            if (i == 13) {
                sAmt_hanja = sAmt_hanja + "兆";
            } else if (i == 9) {
                sAmt_hanja = sAmt_hanja + "億";
            } else if (i == 5) {
                sAmt_hanja = sAmt_hanja + "萬";
            }

            sResult_hanja = sAmt_hanja+sResult_hanja;
        }

        return sResult_hanja;
    }

    public static String convertAmtToHangul(String ps_amt){

        String sArr_hanja[] = {"영", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"};
        String sResult_hanja = "";
        String sAmt_hanja  = "";
        String sOne_num    = "";
        String sBack_amount= "";
        Float fCur_amount  = Float.valueOf(ps_amt);
        int   iAmt_length  = ps_amt.length();
        int   i = 0;

        for (i = iAmt_length; i > 0; i--) {
            int j = 0;
            j = i-1;
            sBack_amount = sBack_amount+ps_amt.charAt(j);
        }

        for (i=1; i <= iAmt_length ; i++) {
            int j = 0;
            j = i -1;
            sOne_num = "";
            sOne_num = sOne_num + sBack_amount.charAt(j);

            if ( sOne_num.equals("0") ) {
                sAmt_hanja = "";
            } else {
                Integer iTemp_hanja = null;
                sAmt_hanja = "";
                iTemp_hanja = Integer.valueOf(sOne_num);
                String sOne_hanja  = sArr_hanja[iTemp_hanja.intValue()];

                sAmt_hanja = sAmt_hanja + sOne_hanja;

                if ( (i == 4) || (i == 8) || (i == 12) ) {
                    sAmt_hanja = sAmt_hanja + "천";
                } else if ( (i == 3) || (i == 7) || (i == 11) || (i == 15) ) {
                    sAmt_hanja = sAmt_hanja + "백";
                } else if ( (i == 2) || (i == 6) || (i == 10) || (i == 14) ) {
                    sAmt_hanja = sAmt_hanja + "십";
                }
            }
            if (i == 13) {
                sAmt_hanja = sAmt_hanja + "조";
            } else if (i == 9) {
                sAmt_hanja = sAmt_hanja + "억";
            } else if (i == 5) {
                sAmt_hanja = sAmt_hanja + "만";
            }

            sResult_hanja = sAmt_hanja+sResult_hanja;
        }

        return sResult_hanja;
    }	
    
    public static String getOnlyNumberChar(String org){
    	StringBuffer buf = new StringBuffer();
    	
    	if(org == null) org = "";
    	
    	for(int i=0 ; i<org.length() ; i++){
    		
    		char ch = org.charAt(i);
    		if(ch >= '0' && ch <= '9'){
    			buf.append(ch);
    		}
    	}
    	
    	return buf.toString();
    }
    
    // password return
//    public static String getPassword(String password){
//    	String hash = password == null ? "" : password;
//    	
//    	if("".equals(hash)) return "";
//    	
//    	try{
//			MessageDigest md = MessageDigest.getInstance("SHA1");
//			MessageDigest md = MessageDigest.getInstance("SHA-256");
//			
//			md.update(password.getBytes("UTF-8"));
//			
//			byte[] raw = md.digest();
//			
//			hash = (new BASE64Encoder()).encode(raw);
//    	}catch(Exception e){
//    		e.printStackTrace();
//    	}
//    	
//    	return hash;
//    }
    
    // 문자열을 이미지로
    public static BufferedImage imgText(String text, String fontUrl){
    	BufferedImage buffer = null;
    	
    	try{
	    	float size           = 20.0f;
	    	String fontName      = "";
	    	Color background     = Color.lightGray;
	    	Color color          = Color.black;
	    	
	    	Font font            = Font.createFont(Font.TRUETYPE_FONT, new FileInputStream(fontUrl));
	    	font                 = font.deriveFont(size);
    	
	    	buffer               = new BufferedImage(1, 1, BufferedImage.TYPE_INT_RGB);
	    	Graphics2D g2        = buffer.createGraphics();
	    	
	    	g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
	    	
	    	FontRenderContext fc = g2.getFontRenderContext();
	    	Rectangle2D bounds   = font.getStringBounds(text, fc);
	    	
	    	int width            = (int)bounds.getWidth();
	    	int height           = (int)bounds.getHeight();
	    	
	    	buffer               = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	    	g2                   = buffer.createGraphics();
	    	
	    	g2.setRenderingHint (RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
	    	g2.setFont          (font);
	    	g2.setColor         (background);
	    	g2.fillRect         (0, 0, width, height);
	    	g2.setColor         (color);
	    	g2.drawString       (text, 0, (int)-bounds.getY());
	    	
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return buffer;
    }
    
    // 랜덤 숫자를 자리 수에 맞게 리턴
    public static int getRandomNum(int size){
    	if(size == 0 || size > 9) return 0;
    	
    	int maxInt   = 10;
    	int smallInt = 10;
    	
    	for(int i=0 ; i<size - 1 ; i++){
    		maxInt = maxInt * 10;
    	}
    	for(int i=0 ; i<size - 2 ; i++){
    		smallInt = smallInt * 10;
    	}
    	
    	Random random = new Random();
    	int num       = 0;
    	
    	do{
    		num = random.nextInt(maxInt - 1);
    	}while(size != 1 && num < smallInt);
    	
    	return num;
    }
	
	public static void main(String[] args){
		//Util.getFirstUpperCase("a가나다");
//		System.out.println(Util.getToVarName("GOODS_NAME"));
		
//		String msg = "c:/abc/cd/";
//		String filenmae = "abc.java";
//		
//		System.out.println(msg.lastIndexOf('/'));
//		System.out.println(msg.length());
//		System.out.println(filenmae.indexOf("."));
		
		//getOnlyNumberChar("123-456-78-90가/!@#!@$$%#&#%^*^&(*%)^");
		try{
//			System.out.println(getRandomNum(1));
			System.out.println(EncryptionUtils.encrypt_sha2("1"));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
