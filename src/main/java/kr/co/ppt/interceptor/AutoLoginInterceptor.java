package kr.co.ppt.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.co.ppt.annotation.AutoLogin;
import kr.co.ppt.serviceImpl.MemberServiceImpl;
import kr.co.ppt.util.SHA_ENC;
import kr.co.ppt.vo.MemberVO;


public class AutoLoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	MemberServiceImpl mService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
try {
			
			if (!(handler instanceof HandlerMethod)) {
				return true;
			}

			AutoLogin sessionCheck =
					((HandlerMethod) handler).getMethodAnnotation(AutoLogin.class);

			if (sessionCheck == null) {
				return true;
			}

			// 그 외에는 어노테이션이 있는 경우인데
			// 이는 세션이 등록되어(loginUser) 그냥 가도 되는경우와
			HttpSession session = request.getSession();
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if (loginUser != null) {
				return true;
			}
			Cookie loginId = WebUtils.getCookie(request, "savedId");
			Cookie loginPassword = WebUtils.getCookie(request, "savedPassword");
			if(loginId != null && loginPassword != null){
				String sessionId = loginId.getValue();
				String sessionPassword = loginPassword.getValue();
				
				MemberVO member = new MemberVO();
				member.setId(sessionId.split("@")[0]);
				member.setDomain(sessionId.split("@")[1]);
				member.setPassword(SHA_ENC.SHA256_Encrypt(sessionPassword));
				MemberVO loginMember = mService.login(member);
				
				if(loginMember != null){
					session.setAttribute("loginUser", loginMember);
					return true;
				}
				
			}


			// 로그인해야하는 경우(로그인 페이지로 sendRedirect) 로 분기가 나뉜다.
			response.sendRedirect(request.getContextPath() + "/login.do");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	
}
