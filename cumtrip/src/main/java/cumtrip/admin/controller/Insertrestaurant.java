package cumtrip.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import cumtrip.admin.service.PlaceService;
import cumtrip.admin.service.RestaurantService;
import cumtrip.vo.MiddleVO;

/**
 * Servlet implementation class Insertrestaurant
 */
@WebServlet("/insertrestaurant.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024*10,
		maxFileSize = 1024*1024*30,
		maxRequestSize = 1024*1024*50
		)
public class Insertrestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	
		RestaurantService service = RestaurantService.getInstance();
		Map<String,Object> map = new HashMap<String,Object>();
		
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		System.out.println(location);
		double xsite = Double.parseDouble(request.getParameter("xsite"));
		System.out.println(xsite);
		double ysite = Double.parseDouble(request.getParameter("ysite"));
		String web = request.getParameter("web");
		String spendtime = request.getParameter("spendtime");
		String codedetail = request.getParameter("codedetail");
		String content = request.getParameter("content");
		String cost = request.getParameter("cost");
		
		map.put("mid_name", name);
		map.put("mid_location", location);
		map.put("mid_x", xsite);
		map.put("mid_y", ysite);
		map.put("mid_web", web);
		map.put("mid_time", spendtime);
		map.put("mid_ex", content);
		map.put("mid_cost", cost);
		map.put("main_cate", codedetail);
		
		int result = service.insertrestaurant(map);
		List<Fileinfo> list = new ArrayList<Fileinfo>();
		
		String uploadPath = "d:/연습용산출물/traveler/restaurant/";
		
		File fdir = new File(uploadPath);
		if(!fdir.exists()) {
			fdir.mkdirs();
		}
		
		String fileName = ""; //파일명이 저장될 변수명 
		Map<String, String> filemap = new HashMap<String,String>();
		filemap.put("mid_name", name);
		System.out.println(name);
		filemap.put("mid_location", location);
		System.out.println(location);
		 int fileresult = 0;
		 //전체 Part객체 개수만큼 반복 	
		 for(Part part : request.getParts()) {
			 // 1개의 업로드 파일 정보를 구한다. 
			 fileName = extractFilename(part);
			
			 if(!fileName.equals("")) {
			 
				 Fileinfo finfo = new Fileinfo();
				 finfo.setFileName(fileName);
				 finfo.setFileSize((int)Math.ceil((part.getSize()/1024.0)));
				 try {
					 //Upload된 파일을 서버쪽 저장장소에 저장한다. 
					 part.write(uploadPath+File.separator+fileName);
					 finfo.setStatus("Success");
				} catch (IOException e) {
					finfo.setStatus("fail : " +e.getMessage());
				}
				 list.add(finfo); // 파일 정보를 List에 추가
				filemap.put("filename", fileName);
				System.out.println(filemap.get("filename"));
				fileresult = service.insertphoto(filemap);
			 }
		 }
		 
		response.sendRedirect(request.getContextPath()+"/admin/addrestaurant.jsp?result="+result);
	}

	private String extractFilename(Part part) {
		String fileName = "";
		
		//각 Part의 Content-Dispostion의 값 구하기 
		String contentDispostion =
				part.getHeader("Content-Disposition");
		String[] items = contentDispostion.split(";");
		for(String item : items) {
			// 파일 정보 찾기 
			if(item.trim().startsWith("filename")) {
				// fileName="test1.txt"
				fileName = item.substring(item.indexOf("=")+2,item.length()-1);
			}
		}
		
		return fileName;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
