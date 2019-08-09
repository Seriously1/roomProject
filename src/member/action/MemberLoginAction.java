package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import room.model.MemberDAO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginAction");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		MemberDAO dao = new MemberDAO();
		int check = dao.loginCheck(id, pwd);
		System.out.println("check = " + check);
		if (check == 0) // 아이디나 비밀번호가 틀릴 경우 -> 다시 로그인 화면으로 이동
		{
			request.setAttribute("fail", "0");

			forward.setRedirect(false);
			forward.setPath("login.to");
		} else {
			// 로그인 성공 -> 세션에 아이디를 저장
			session.setAttribute("sessionID", id);

			// 로그인 성공후 메인화면으로 이동
			forward.setRedirect(true);
			forward.setPath("index.to");
		}

		return forward;

	}

}
