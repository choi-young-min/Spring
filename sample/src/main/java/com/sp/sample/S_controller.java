package com.sp.sample;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.domain.BoardVO;
import com.sp.domain.MemberVO;
import com.sp.domain.ReplyVO;
import com.sp.service.BoardService;
import com.sp.service.MemberService;
import com.sp.service.ReplyService;

@Controller
@RequestMapping("*")
public class S_controller {
	
	private static final Logger logger = LoggerFactory.getLogger(S_controller.class);
	
	@Inject
	MemberService Memberservice;

	@Inject
	BoardService Boardservice;
	
	@Inject 
	ReplyService Replyservice;
	 
	@RequestMapping("/main")
	public void goMain() {
		logger.info("main");
	}

	@RequestMapping("/joinform")
	public void goJoinForm() {
		logger.info("form");
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberVO vo,Model model) throws Exception {
		int result = Memberservice.insertMember(vo);
		model.addAttribute("join_result",result);
		return "main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session,String id,String pwd,Model model) throws Exception {
		MemberVO vo = new MemberVO();
		vo = Memberservice.loginMember(id);
		String msg = "fail";
		if(vo.getId() != null) {
			if(vo.getPwd().equals(pwd)) {
				msg = "success";
				session.setAttribute("id", vo.getId());
				session.setAttribute("name", vo.getName());
			}
		}
		model.addAttribute("msg",msg);
		return "main";
	}
	
	  @RequestMapping(value="/board") 
	  public void board(HttpServletRequest request, Model model, String BoardNum) throws Exception{ 
		  logger.info("board");
		  HttpSession session = request.getSession();
		  String id = (String)session.getAttribute("id");
		  String start = BoardNum; 
		  	if(start == null) { start = "1"; } 
		  	int cnt = 20; 
		  	int st = (Integer.parseInt(start)-1)*cnt;
	  
		  	List<BoardVO> list = null;
	  
		  list = Boardservice.getList(st,cnt); 
		  double count = Math.ceil(Boardservice.getBoardCount()/cnt); 
		  int count1 = (int)count;
		  logger.info(Boardservice.getBoardCount()/cnt+"");
		  int [] rep = new int[count1]; 
		  for(int i=0; i<=rep.length-1; i++) { 
			  rep[i] = i+1; 
		  }
		  session.setAttribute("id", id);
		  model.addAttribute("list", list); 
		  model.addAttribute("rep", rep);
	  }
	  
	  @RequestMapping(value="/board/get")
	  public String getContent(HttpServletRequest request, Model model, int bno) throws Exception{
		  logger.info("get");
		  HttpSession session = request.getSession();
		  String id = (String)session.getAttribute("id");
		  List<ReplyVO> list = new ArrayList<ReplyVO>();
		  	//댓글 번호
			String start = request.getParameter("replyNum");
			if(start == null) {
				start = "1";
			}
			int cnt = 10; //현 페이지에 출력될 갯수
			//댓글 가져오기
			list = Replyservice.getReplyList(bno,(Integer.parseInt(start)-1)*cnt,cnt);
			double count = Math.ceil(Replyservice.getReplyCount(bno)/cnt);
			int count1 = (int)count;
			
			int [] reply = new int[count1];
			for(int i=0; i<=reply.length-1; i++) {
				reply[i] = i+1;
			}
			model.addAttribute("list",list);
			model.addAttribute("reply",reply);
			model.addAttribute("id",id);
			model.addAttribute("board",Boardservice.getContent(bno));
		  return "boardContent";
	  }
	  
	  @RequestMapping(value="/board/insertreply")
	  public String insertReply(HttpServletRequest request, @RequestParam("reply-content")String content, ReplyVO vo) throws Exception{
		  logger.info("reply");
		  HttpSession session = request.getSession();
		  String id = (String)session.getAttribute("id");
		  vo.setW_id(id);
		  vo.setContent(content);
		  Replyservice.insertReply(vo);
		  return "redirect: /board/get?bno="+vo.getBno();
	  }
	  
	  @RequestMapping(value="/board/deletereply")
	  public String deleteReply(@RequestParam("rno") int rno, int bno) throws Exception{
		  logger.info("replydelete");
		  Replyservice.replyDelete(rno);
		  return "redirect: /board/get?bno="+bno;
	  }
	  @RequestMapping(value="/board/writeform")
	  public String boardWriteForm(HttpServletRequest request, Model model)throws Exception{
		  logger.info("boardWriteform");
		  HttpSession session = request.getSession();
		  String id = (String)session.getAttribute("id");
		  model.addAttribute("w_id",id);
		  return "boardWrite";
	  }
	  
	  @RequestMapping(value="/board/insert")
	  public String insertBoard(BoardVO vo) throws Exception{
		  logger.info("insert");
		  int result = Boardservice.insertBoard(vo);
		  if(result > 0) {
			  
		  }
		  return "redirect:/board";
	  }
	  
	  @RequestMapping(value="/board/remove")
	  public String removeBoard(int bno) throws Exception{
		  logger.info("remove");
		  Boardservice.removeBoard(bno);
		  return "redirect:/board";
	  }
	  
	  @RequestMapping(value="/board/update")
	  public String updateBoard(BoardVO vo) throws Exception{
		  logger.info("update");
		  Boardservice.updateBoard(vo);
		  return "redirect:/board/get?bno="+vo.getBno();
	  }
	  
	  @RequestMapping(value="/board/updateform")
	  public String updateForm(Model model, BoardVO vo) throws Exception {
		  logger.info("updateform");
		  model.addAttribute("board",vo);
		  return "updateform";
	  }
	  
	  @RequestMapping(value="/board/logout")
	  public String logout(HttpServletRequest request,Model model) throws Exception{
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
			model.addAttribute("logout_success","success");
		}
		  return "main";
	  }
}
