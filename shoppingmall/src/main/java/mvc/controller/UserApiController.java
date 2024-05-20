package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import mvc.dao.UserDAO;
import mvc.dto.UserDTO;

@WebServlet("*.api")
public class UserApiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/"));
		
		if(action.equals("/idCheck.api")) {
			String userId = request.getParameter("userId");
			UserDTO dto = new UserDTO();
			dto.setUserId(userId);
			
			UserDAO dao = new UserDAO();
			dto = dao.getUser(dto);
			String cnt = "0";
			if(dto != null) {
				cnt = "1";
			}
			
			Map<String, String> rs = new HashMap<String, String>();
			rs.put("rs", cnt);
			
			Gson gson = new Gson();
			String json = gson.toJson(rs);
			
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}
	}
}
