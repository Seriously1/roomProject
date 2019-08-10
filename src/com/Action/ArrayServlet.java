package com.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.util.Arrays;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import map.bit.kakaomaptest.kakaoDAO;
import map.bit.kakaomaptest.kakaoVO;

@WebServlet("/ArrayServlet.do11")
public class ArrayServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public ArrayServlet() {
		super();
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		if (request.getParameterValues("string[]") != null) {
			String[] arrayStr = request.getParameterValues("string[]");
			System.out.println(Arrays.toString(arrayStr) + "here!");

			kakaoVO vo = new kakaoVO(arrayStr[1], arrayStr[0], arrayStr[2], "123");
			int result = kakaoDAO.getInstance().insert(vo);

			System.out.println("data save success!" + result);

			PrintWriter out = response.getWriter();
			out.write("[\"" + arrayStr[2] + "\",\"" + result + "\"]");
			out.close();
		}		

		if (request.getParameter("latlng") != null) {
			String latlng = request.getParameter("latlng");
			//System.out.println(latlng);
			ArrayList<kakaoVO> clusterarr =new ArrayList<kakaoVO>();
			clusterarr = kakaoDAO.getInstance().getdb_to_markercluster(latlng);
			
			System.out.println("map���� ������ Ŭ������ ������ ="+clusterarr.size());
			
			
	        //person�� JSON������ ���� Array ����
	        JSONArray personArray = new JSONArray();
	        //person�� �Ѹ� ������ �� JSONObject ����
	        
	      //  JSONObject personInfo = new JSONObject();
	        //���� �Է�
	        //JSONA
	        
	        JSONObject personInfoinner= null;
			for (int i = 0; i < clusterarr.size(); i++) {
	        	JSONObject personInfo= new JSONObject();
	        	personInfo.put("lat", clusterarr.get(i).getLat());
		        personInfo.put("lng", clusterarr.get(i).getLng());
		        personInfoinner = new JSONObject();
		        personInfoinner.put("position", personInfo);
		        personInfoinner.put("text", clusterarr.get(i).getAddr());
		        personArray.add(personInfoinner);
		        	
			}
			System.out.println();
			System.out.println(personArray.toJSONString());
			System.out.println();
			
			/*
			 * if(personArray != null){ PrintWriter out = response.getWriter(); //Iterable
			 * it = (Iterable)personInfoinner.keySet().iterator();
			 * out.write("[\""+personInfoinner+"\"]"); out.close(); }
			 */      
			
			PrintWriter out = response.getWriter();
			out.println(personArray);
			out.flush();
			out.close();
			/*
			 * out.write("[\"" + "123" + "\",\"" + "234" + "\"]"); out.close();
			 */
			
			
			 
			
			
			
			//�ʿ����̴� �ִ�  ������� �����ϴ� ������� �����ϴܿ� ��ǥ���� ������ �ش���ǥ���ȿ��ִ� ��ĿŬ�����͵�����
			//��  kakaoVO�� ArrayList�� ������.			
			
			
			//�����ؾ��ҰŴ� ArrayList�� jsp�� ������ ��ĿŬ������ ��°�
			
			
			
			
			
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
