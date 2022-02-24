package com.ktds.biz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspViewController {

	@RequestMapping(value = "/")
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/login")
	public void login() {
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.setAttribute("sessionID", null);
		session.setAttribute("sessionNAME", null);
		session.setAttribute("sessionROLE", null);

		return "login";
	}

	@RequestMapping(value = "/register")
	public void register() {
	}

	@RequestMapping(value = "/main")
	public String main() {
		return "/main";
	}

	@RequestMapping(value = "/iframe/AutoOrder")
	public void AutoOrder() {
	}

	@RequestMapping(value = "/iframe/Pretreatment")
	public void Pretreatment() {
	}

	@RequestMapping(value = "/iframe/PretreatmentResult")
	public void PretreatmentResult() {
	}
	
	@RequestMapping(value = "/iframe/Dashboard")
	public void DashboardSample() {
	}

	@RequestMapping(value = "/iframe/Learning")
	public void Learning() {
	}

	@RequestMapping(value = "/iframe/RunForecast")
	public void RunForecast() {
	}

	@RequestMapping(value = "/iframe/RunForecastResult")
	public void RunForecastResult() {
	}

	@RequestMapping(value = "/iframe/Statistics_m1")
	public void Statistics1() {
	}

	@RequestMapping(value = "/iframe/Statistics_m2")
	public void Statistics2() {
	}

	@RequestMapping(value = "/iframe/Statistics_m3")
	public void Statistics3() {
	}

	@RequestMapping(value = "/iframe/NoticeBoard")
	public void NoticeBoard() {
	}

	@RequestMapping(value="/iframe/admin/NoticeMgr")
	public void NoticeMgr() {
	}

	@RequestMapping(value = "/iframe/admin/UserMgr")
	public void UserMgr() {
	}
	//여기서부터 시작 - 관리자
	@RequestMapping(value = "/include/Dashboard")
	public void Dashboard() {
	}
	@RequestMapping(value = "/admin/DashboardMgr")
	public void DashboardMgr() {
	}
	@RequestMapping(value = "/admin/MenuAdmin")
	public void MenuAdmin() {
	}
	@RequestMapping(value = "/admin/UserAdmin")
	public void UserAdmin() {
	}
	@RequestMapping(value = "/admin/DeptAdmin")
	public void DeptAdmin() {
	}
	@RequestMapping(value = "/admin/CommonCodeAdmin")
	public void CommonCode() {
	}
	@RequestMapping(value = "/admin/DashboardAdmin")
	public void DashboardAdmin() {
	}
	//업무
	@RequestMapping(value = "/callreport/CallReport")
	public void CallReport() {
	}
	@RequestMapping(value = "/callreport/RegistPage")
	public void RegistPage() {
	}
	@RequestMapping(value = "/deal/DealInv")
	public void DealInv() {
	}
	@RequestMapping(value = "/deal/DealRegist")
	public void DealRegist() {
	}
	
	@RequestMapping(value = "/deal/DealLedger")
	public void DealLedger() {
	}
	@RequestMapping(value = "/deal/DealLedgerRegist")
	public void DealLedgerRegist() {
	}
	@RequestMapping(value = "/deal/DealDashboard")
	public void DealDashboard() {
	}
	//기업고객 조회
	@RequestMapping(value = "/epr/EprSearch")
	public void EprSearch() {
	}
	//기업고객 등록
	@RequestMapping(value = "/epr/EprRegist")
	public void EprRegist() {
	}
	//인물고객 상세
	@RequestMapping(value = "/epr/EprView")
		public void EprView() {
	}
	//인물고객 조회
	@RequestMapping(value = "/moc/MocSearch")
	public void MocSearch() {
	}
	//인물고객 등록
	@RequestMapping(value = "/moc/MocRegist")
	public void MocRegist() {
	}
	//인물고객 상세
	@RequestMapping(value = "/moc/MocView")
	public void MocView() {
	}
}
