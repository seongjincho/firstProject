package org.yht.controller.bbs;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import org.yht.service.bbs.FoodService;

import yht.framework.util.MediaUtils;
import yht.framework.util.UploadFileUtils;





@Controller
public class UploadController {

	
	
	// xml에 설정된 리소스 참조
	// bean의 id가 uploadPath인 태그를 참조
	
	private String uploadPath = "C:\\Users\\Shin\\Desktop\\fpgit\\firstProject\\spring3_yht_light\\WebContent\\upload\\";
	
	@Inject
	FoodService foodService;
	
	
	// 업로드 흐름 : 업로드 버튼클릭 => 임시디렉토리에 업로드 => 지정된 디렉토리에 저장 => 파일정보가 file에 저장
	
	/******************************* # ajax 방식의 업로드 처리 *****************************/
	// Ajax업로드 페이지 매핑
	@RequestMapping(value="uploadAjax.do", method = {RequestMethod.GET})
	public void uploadAjax() {
		// uploadAjax.jsp로 포워딩
	}

	
	// Ajax업로드 처리 매핑
	@ResponseBody 	// view가 아닌 data리턴  
	@RequestMapping(value="uploadAjax.do", method = {RequestMethod.POST})
	public ResponseEntity<String> uploadAjax(@RequestParam(value="file", required=false)MultipartFile file ) throws Exception {
		System.out.println("orginalName : " + file.getOriginalFilename());
		System.out.println("size : " + file.getSize());
			System.out.println("contentType : " + file.getContentType());
		
		 // 응답헤더 지정
		    HttpHeaders resHeaders = new HttpHeaders();
		    resHeaders.add("content-type", "application/json;charset=UTF-8");
		    //resHeaders.setContentType(new MediaType("text", "xml", Charset.forName("UTF-8")));
		     
		   	     
/*   return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes())
		   , resHeaders, HttpStatus.OK);*/
			

			
			
		return new ResponseEntity<String>(URLEncoder.encode(UploadFileUtils.uploadFile(uploadPath,
				file.getOriginalFilename(), file.getBytes()), "UTF-8"), resHeaders, HttpStatus.OK);
		
	}
				
	// 이미지 표시 매핑
	@ResponseBody	// view가 아닌 data리턴 
	@RequestMapping("displayFile.do")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		// 서버의 파일을 다운로드하기 위한 스트림
		InputStream in = null; // java.io
		ResponseEntity<byte[]> entity = null;
		//System.out.println("display.do 파일네임=" + fileName);
		try {
			// 확장자를 추출하여 formatName에 저장
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			//System.out.println("확장자명="+ formatName);
			// 추출한 확장자를 MediaUtils클래스에서 이미지파일여부를 검사하고 리턴받아 mType에 저장
			MediaType mType = MediaUtils.getMediaType(formatName);
		//System.out.println("엠타입="+mType);
			// 헤더 구성 객체(외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 떄문에)
			HttpHeaders headers = new HttpHeaders();
			// InputStream 생성
			in = new FileInputStream(uploadPath + fileName);
			// 이미지 파일이면
			if (mType != null) {
				headers.setContentType(mType);			
			// 이미지가 아니면
			} else {
				fileName = fileName.substring(fileName.indexOf("_")+1); 
				/*URLEncoder.encode(, "UTF-8")*/
				
				//System.out.println("파일네임1=" + fileName);
				// 다운로드용 컨텐트 타입
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				//
				// 바이트배열을 스트링으로 : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 서유럽언어, 큰 따옴표 내부에 " \" 내용 \" "
				// 파일의 한글 깨짐 방지																										
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
				 //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
			}
			// 바이트배열, 헤더, HTTP상태코드              
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// HTTP상태 코드()
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close(); // 스트림 닫기
		}
		return entity;
	}

	// 파일 삭제 매핑
	@ResponseBody	// view가 아닌 데이터 리턴
	@RequestMapping(value="deleteFile.do", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		// 파일의 확장자 추출
		/*System.out.println("파일네임ㄴ=" + fileName);*/
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		/*System.out.println("파일네임2=" + fileName);
		System.out.println("포멧네임2=" + formatName);*/
		String realformatName = formatName.substring(0, 3);
		/*System.out.println("레알포멧네임=" + realformatName);*/
		// 이미지 파일 여부 검사
		MediaType mType = MediaUtils.getMediaType(realformatName);
		/*System.out.println("엠타입=" + mType);*/
		
		// 이미지의 경우(썸네일 + 원본파일 삭제), 이미지가 아니면 원본파일만 삭제
		// 이미지 파일이면
			String front = fileName.substring(fileName.indexOf("<",3));
			System.out.println("프론트1= " + front);
			String Fdate = front.substring(46, 57);
			System.out.println("날짜=" + Fdate);
			String front1 = front.substring(57,59);
			System.out.println("프론트1_1=" + front1);
			// 원본 이미지 파일 추출 s_를 제외한 부분 잘라내기
			//String front = fileName.substring(0, 12);
			String end = front.substring(59);
			System.out.println("엔드=" + end);
			String end1= end.substring(0, end.length()-6);
			System.out.println("엔드1=" + end1);
			if (mType != null) {
			// 원본 이미지 삭제 
			new File(uploadPath + Fdate+ (front1+end1).replace('/', File.separatorChar)).delete();
			System.out.println("원본 =" + new File(uploadPath + Fdate + (front1+end1).replace('/', File.separatorChar)));	
		}
		// 썸네일 파일 삭제 / 텍스트인경우 s_가 안붙기 때문에 전체경로가 원본
		new File(uploadPath + Fdate+ end1.replace('/', File.separatorChar)).delete();		
		//System.out.println("썸네일 = " + new File(uploadPath + fileName.replace('/', File.separatorChar)));
	//	System.out.println("텍스트원본 = " + new File(uploadPath + Fdate + fileName.replace('/', File.separatorChar)));
		
		// 레코드 삭제
		//foodService.deleteFile(fileName);
				
		// 데이터와 http 상태 코드 전송
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	/******************************* # ajax 방식의 업로드 처리 *****************************/
	
	
	
	
}
