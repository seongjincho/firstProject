package yht.framework.util;

import java.util.StringTokenizer;

public class StringMng {
    public StringMng() {
    }

    public static String fixedLength(String str, int len, String strTofill) {
        StringBuffer sb;
        try {
            byte srcByteArr[] = str.getBytes();
            byte tmpBytArr[] = new byte[len];
            byte byteTofill = strTofill.getBytes()[0];
            for(int i = 0; i < len; i++) {
                if(i < srcByteArr.length) {
                    tmpBytArr[i] = srcByteArr[i];
                } else {
                    tmpBytArr[i] = byteTofill;

                }
            }
            if(srcByteArr.length > len) {
                int no_minus = 0;
                for(int i = len - 1; i >= 0 && tmpBytArr[i] < 0; i--) {
                    no_minus++;

                }
                if(no_minus % 2 == 1) {
                    tmpBytArr[len - 1] = byteTofill;
                }
                str = new String(tmpBytArr);
            }
            String s1 = new String(tmpBytArr);
            return s1;
        } catch(Exception e) {
            sb = new StringBuffer();
        }
        sb.setLength(len);
        for(int i = 0; i < len; ) {
            sb.setCharAt(i++, ' ');

        }
        String s = sb.toString();
        return s;
    }

    public static String fixedLength(String str, int len) {
        return fixedLength(str, len, " ");
    }

    public static int getByteLength(String str) {
        if(str == null) {
            return 0;
        } else {
            return str.getBytes().length;
        }
    }

    public static String replaceStr(String source, String keyStr, String toStr[]) {
        if(source == null) {
            return null;
        }
        int startIndex = 0;
        int curIndex = 0;
        int i = 0;
        StringBuffer result = new StringBuffer();
        String specialString = null;
        while((curIndex = source.indexOf(keyStr, startIndex)) >= 0) {
            if(i < toStr.length) {
                specialString = toStr[i++];
            } else {
                specialString = " ";
            }
            result.append(source.substring(startIndex, curIndex)).append(specialString);
            startIndex = curIndex + keyStr.length();
        }
        if(startIndex <= source.length()) {
            result.append(source.substring(startIndex, source.length()));
        }
        return result.toString();
    }

    public static String replaceStr(String source, String keyStr, String toStr) {
        if(source == null) {
            return null;
        }
        int startIndex = 0;
        int curIndex = 0;
        StringBuffer result = new StringBuffer();
        while((curIndex = source.indexOf(keyStr, startIndex)) >= 0) {
            result.append(source.substring(startIndex, curIndex)).append(toStr);
            startIndex = curIndex + keyStr.length();
        }
        if(startIndex <= source.length()) {
            result.append(source.substring(startIndex, source.length()));
        }
        return result.toString();
    }

    public static String fmtStr(String str, String format) {
        if(str == null) {
            return "";
        }
        StringBuffer buf = new StringBuffer();
        char f[] = format.toCharArray();
        char s[] = str.toCharArray();
        int len = f.length;
        int h = 0;
        for(int i = 0; i < len && h < s.length; i++) {
            if(f[i] == '#') {
                buf.append(s[h++]);
            } else {
                buf.append(f[i]);

            }
        }
        return buf.toString();
    }

    public static String cutblank(String str) {
        int st = 0;
        char val[] = str.toCharArray();
        int count = val.length;
        int len;
        for(len = count; st < len && (val[st] <= ' ' || val[st] == '\u3000'); st++) {
            ;
        }
        for(; st < len && (val[len - 1] <= ' ' || val[len - 1] == '\u3000'); len--) {
            ;
        }
        return st <= 0 && len >= count ? str : str.substring(st, len);
    }

    public static String translateNewline(String source, String specialString) {
        String result = "";
        for(StringTokenizer st = new StringTokenizer(source, "\n"); st.hasMoreTokens(); ) {
            result = String.valueOf(result) + String.valueOf(String.valueOf(st.nextToken()) +
                     String.valueOf(specialString));

        }
        return result;
    }

    public static String lpad(String src, char putChar, int cnt){
        String valueStr = "";
        if(src != null && src.length() < cnt){
            int srcCnt = src.length();
            int forCnt = cnt - srcCnt;
            String putString = "";

            for(int i=0 ; i<forCnt ; i++){
                putString += String.valueOf(putChar);
            }
            valueStr = putString + src;
        } else {
            valueStr = src;
        }

        return valueStr;
    }

    public static String rpad(String src, char putChar, int cnt){
        String valueStr = "";
        if(src != null && src.length() < cnt){
            int srcCnt = src.length();
            int forCnt = cnt - srcCnt;
            String putString = "";

            for(int i=0 ; i<forCnt ; i++){
                putString += String.valueOf(putChar);
            }

            valueStr = src + putString;
        } else {
            valueStr = src;
        }

        return valueStr;
    }

    public static String getZeroToEmpty(String text)
    {
        String rtn = "";

        if (text == null)
            return rtn;
        else if ( text.toLowerCase().equals("null") || text.toLowerCase().equals("0"))
            return rtn;
        else
            return text;
    }

    public static String toUpperCase(String text){
    	if (text == null || text.equals("")){
    		return "";
    	}
    	
    	StringBuffer rtn = new StringBuffer();
    	
    	char[] charArr = text.toCharArray();
    	
    	for(int i=0; i<charArr.length ; i++){
    		
    		System.out.println(charArr[i]);
    		
    		if(97 <= charArr[i] && charArr[i] <= 122){
    			charArr[i] -= 32;
    		}
    		
   			rtn.append(charArr[i]);
    	}
    	
    	return rtn.toString();
    }
    
    /**
     * 
     * @param text
     * @return
     */
    public static String toLowerCase(String text){
    	if (text == null || text.equals("")){
    		return "";
    	}
    	
    	StringBuffer rtn = new StringBuffer();
    	
    	char[] charArr = text.toCharArray();
    	
    	for(int i=0; i<charArr.length ; i++){
    		if(65 <= charArr[i] && charArr[i] <= 90){
    			charArr[i] += 32;
    		}
    		
   			rtn.append(charArr[i]);
    	}
    	
    	return rtn.toString();
    }
    
    /**
     * String을 지정된 길이만큼만 출력할 수 있도록 하며, 만약 일부분만이 출력되는 경우에는 "..."를 끝에 추가한다.
     * strSource의 앞뒤에 공백문자가 포함되어 있는 경우 trim을 수행한다.
     * 
     *  cutByte값은 문자열의 byte 길이를 의미한다.  한글과 같이 2byte character는 2로 계산하며, 영문 및 반각 기호는 1로 계산한다.
     * 
     * @param strSource 변환하고자 하는 원본 문자열. null인 경우 공백문자열이 반환된다.
     * @param cutByte 변환후 총 길이(postfix 문자열 "..."의 길이 포함).  반드시 4 이상의 숫자를 입력해야 한다.  그렇지 않은 경우 원본 문자열을 그대로 반환한다.
     * @return 변환된 결과 문자열을 return 한다. 단, strSource가 null인 경우 공백문자열이 반환되며 cutByte가 4 미만의 숫자가 오는 경우 원본 문자열을 그대로 반환한다.
     */
    public static String cutBytes(String strSource, int cutByte) {
       return cutBytes( strSource, cutByte, true, "..." );
    }
    
    /**
     * String을 지정된 길이만큼만 출력할 수 있도록 하며, 만약 일부분만이 출력되는 경우에는 "..."를 끝에 추가한다.
     * 지정된 postfix 문자열을 끝에 추가한다. 
     * 
     *  cutByte값은 문자열의 byte 길이를 의미한다.  한글과 같이 2byte character는 2로 계산하며, 영문 및 반각 기호는 1로 계산한다.
     * 
     * @param strSource 변환하고자 하는 원본 문자열. null인 경우 공백문자열이 반환된다.
     * @param cutByte 변환후 총 길이(postfix 문자열의 길이 포함).  반드시 4 이상의 숫자를 입력해야 한다.  그렇지 않은 경우 원본 문자열을 그대로 반환한다.
     * @param bTrim 원본 문자열의 앞뒤에 공백문자가 있을경우 trim을 수행할지를 결정한다. 
     * @return 변환된 결과 문자열을 return 한다. 단, strSource가 null인 경우 공백문자열이 반환되며 cutByte가 4 미만의 숫자가 오는 경우 원본 문자열을 그대로 반환한다.
     */
    public static String cutBytes(String strSource, int cutByte, boolean bTrim) {
       return cutBytes( strSource, cutByte, bTrim, "..." );
    }
    
    /**
     * String을 지정된 길이만큼만 출력할 수 있도록 하며, 만약 일부분만이 출력되는 경우에는
     * 지정된 postfix 문자열을 끝에 추가한다. 
     * 
     *  cutByte값은 문자열의 byte 길이를 의미한다.  한글과 같이 2byte character는 2로 계산하며, 영문 및 반각 기호는 1로 계산한다.
     * 
     * @param strSource 변환하고자 하는 원본 문자열. null인 경우 공백문자열이 반환된다.
     * @param cutByte 변환후 총 길이(postfix 문자열의 길이 포함).  반드시 strPostfix문자열의 byte크기 이상의 숫자를 입력해야 한다.  그렇지 않은 경우 원본 문자열을 그대로 반환한다.
     * @param bTrim 원본 문자열의 앞뒤에 공백문자가 있을경우 trim을 수행할지를 결정한다. 
     * @param strPostfix 문자열이 잘릴경우 이를 표현하기 위한 문자열. null인 경우 "..."이 추가된다.
     * @return 변환된 결과 문자열을 return 한다. 단, strSource가 null인 경우 공백문자열이 반환되며 cutByte가 strPostfix문자열의 byte크기 미만의 숫자가 오는 경우 원본 문자열을 그대로 반환한다.
     */
    public static String cutBytes(String strSource, int cutByte, boolean bTrim, String strPostfix) {
       
       if( strSource == null ) return "";

       strPostfix = (strPostfix == null) ? "..." : strPostfix;
       int postfixSize = 0;
       for( int i=0; i < strPostfix.length(); i ++ ) {
          if( strPostfix.charAt( i ) < 256 )
             postfixSize += 1;
          else
             postfixSize += 2;
       }
       
       if( postfixSize > cutByte )
          return strSource;
       
    
       if( bTrim ) strSource = strSource.trim(); 
       char[] charArray = strSource.toCharArray();


       
       int strIndex = 0;
       int byteLength = 0;
       for( ; strIndex < strSource.length(); strIndex++ ) {
          
          int byteSize = 0;
          if( charArray[ strIndex ] < 256) {
             // 1byte character 이면
             byteSize = 1; 
          }
          else {
             // 2byte character 이면
             byteSize = 2;
          }

          if( ( byteLength + byteSize ) > cutByte - postfixSize ) {
             break;
          }
          
          byteLength = byteLength += byteSize;
       }        
       
       if( strIndex == strSource.length() ) 
          strPostfix = "";
       else {
          if( (byteLength + postfixSize) < cutByte )
             strPostfix = " " + strPostfix;
       }

       return strSource.substring( 0, strIndex ) + strPostfix;        
    }
}
