package com.hotel.app.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hotel.app.aop.exception.AdminAuthException;

public class AdminSessionCheckAspect {
	private static Logger logger = LoggerFactory.getLogger(AdminSessionCheckAspect.class);
	
	public Object sessionCheck(ProceedingJoinPoint joinPoint) throws AdminAuthException, Throwable{
		Object result=null; //로그인 여부에 따라서 채워질 데이터가 결정
		//로그인 한 사람 : proceed()메서드의 반환값 
		//로그인 안 한 사람 :  view/error  
		
		Class target=joinPoint.getTarget().getClass();
		
		logger.info("원래 호출하려고 했던 클래스는 "+target.getName());
		logger.info("원래 호출하려고 했던 메서드는 "+joinPoint.getSignature());
		
		//HttpServletRequest 꺼내기!
		Object[] args = joinPoint.getArgs();
		logger.info("매개변수의 갯수는 "+args.length);
		
		//매개변수의 갯수를 예측할 수 없으므로, 반복문을 이용하여 request를 발견하고, 발견되면 보관
		HttpServletRequest request=null;
		HttpSession session=null;
		
		for(int i=0;i<args.length;i++) {
			if(args[i] instanceof HttpServletRequest) {//발견!!
				request=(HttpServletRequest)args[i];
			}
		}
		
		String uri=request.getRequestURI();
		
		if(uri.equals("/admin/signin") || uri.equals("/admin/login")) {
			//로그인 체크를 하지 않아도 되는 요청이라면...그냥 가던길 가게 해주고
			result=joinPoint.proceed();
		}else { 
			if(request !=null) { //요청 객체가 존재한다면..
				//세션을 꺼내자!!
				session = request.getSession();
				if(session.getAttribute("admin")==null) {
					//로그인 하지 않은 경우로 본다!!!
					logger.info("관리자 로그인이 필요합니다");
					
					throw new AdminAuthException("예외발생 - 관리자 로그인이 필요한 서비스입니다");
				}else {
					logger.info("로그인 상태군요");
					//가로챈 메서드 호출을 다시 진행시킨다!!
					result=joinPoint.proceed();
					logger.info("원래메서드 호출 후 반환값 : "+result);
				}
			}
		}
		return result;
	} 
}