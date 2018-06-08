package jsp.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.member.model.MemberDAO;

/**
 * 회원삭제 작업을 처리하는 Action 클래스
 */
public class MemberDeleteAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
		String password = request.getParameter("password");
		
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.loginCheck(id, password);
		
		if(check != 0){
			int check2 = dao.deleteMember(id, password);
			if(check2==1) {
				// 세션의 회원정보 삭제
				session.removeAttribute("sessionID");
				forward.setRedirect(true);
				forward.setNextPath("ResultForm.do");
			}else {
				System.out.println("회원 삭제 실패");
				return null;
			}
		}
		else{
			forward.setRedirect(true);
			forward.setNextPath("DeleteForm.do");
		}
		return forward;
	}
}
