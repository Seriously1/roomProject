package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.Action;
import member.action.ActionForward;
import member.action.EmailAction;
import member.action.JoinAction;
import member.action.MemberLoginAction;
import member.action.MemberLogoutAction;
import member.model.MemberDAO;

@WebServlet("*.to")
public class MemberController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

   private static final long serialVersionUID = 1L;

   protected void doProcess(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String RequestURI = request.getRequestURI();
      String contextPath = request.getContextPath();
      String command = RequestURI.substring(contextPath.length());
      ActionForward forward = null;
      Action action = null;

      if (command.equals("/register2.to")) {
         forward = new ActionForward();
         forward.setRedirect(false);
         forward.setPath("register2.jsp");
         
      } else if (command.equals("/JoinAction.to")) {
         action = new JoinAction();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
      } else if (command.equals("/register3.to")) {
          forward = new ActionForward();
          forward.setRedirect(false);
          forward.setPath("register3.jsp");
       } else if (command.equals("/email.to")) {
           forward = new ActionForward();
           forward.setRedirect(false);
           forward.setPath("email.jsp");
           
        } else if (command.equals("/EmailAction.to")) {
            action = new EmailAction();
            try {
               forward = action.execute(request, response);
            } catch (Exception e) {
               e.printStackTrace();
            }
         } else if (command.equals("/emailOk.to")) {
             forward = new ActionForward();
             forward.setRedirect(false);
             forward.setPath("emailOk.jsp");
             
          } else if (command.equals("/login.to")) {
         forward = new ActionForward();
         forward.setRedirect(false);
         forward.setPath("login.jsp");
         
      }  else if (command.equals("/register.to")) {
         forward = new ActionForward();
         forward.setRedirect(false);
         forward.setPath("register.jsp");
         
      } else if (command.equals("/index.to")) {
         forward = new ActionForward();
         forward.setRedirect(false);
         forward.setPath("index.jsp");
         
      } else if (command.equals("/logout.to")) {
         action = new MemberLogoutAction();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
      } else if (command.equals("/MemberLoginAction.to")) {
         action = new MemberLoginAction();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
      } else if (command.equals("/idCheck.to")) {
         String id = request.getParameter("id");
         response.getWriter().write(new MemberDAO().idCheck(id) + "");
      }

      if (forward != null) {
         if (forward.isRedirect()) {
            response.sendRedirect(forward.getPath());
         } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
            dispatcher.forward(request, response);
         }
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