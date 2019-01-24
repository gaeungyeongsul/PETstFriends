package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.ApplyDao;
import model.MeetingBoard;
import model.MeetingBoardApply;
import model.MeetingBoardReview;
import model.MeetingComment;
import model.MeetingLikes;
import model.ReviewComment;
import model.User;
import service.MeetingServiceImpl;
import service.UserServiceImpl;

@Controller
public class MeetingBoardController {

	@Autowired
	private MeetingServiceImpl meetingServiceImpl;
	
	@Autowired
	private UserServiceImpl userServiceImpl;

	@RequestMapping("meeting.do") // void !!
	public String meeting(Model model, HttpSession session) {
		String user_idCheck = (String) session.getAttribute("user_id");
		model.addAttribute("user_idCheck", user_idCheck);
		return "meeting/meeting";
	}

	@RequestMapping("meetingview.do") // void !!
	public String meetingView(Model model, @RequestParam int meeting_boardno,@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "0") int trigger, @RequestParam(defaultValue = "0") int tri, @RequestParam(defaultValue="1") int rpage
			, @RequestParam(defaultValue = "0") int triapply, HttpSession session) {
		String user_idCheck = (String) session.getAttribute("user_id");
		model.addAttribute("user_idCheck", user_idCheck);
//		MeetingBoardApply applyCheck = meetingServiceImpl.selectApplyone(user_idCheck, meeting_boardno);
		List<MeetingBoardApply> applyinone = meetingServiceImpl.showApply(meeting_boardno);
		model.addAttribute("apply_inone", applyinone);
//		model.addAttribute("applyCheck", applyCheck);
		model.addAttribute("meeting", meetingServiceImpl.selectMeetingBoard(meeting_boardno));
		List<MeetingComment> mcomment= new ArrayList<MeetingComment>();
		List<MeetingComment> mcomment2= new ArrayList<MeetingComment>();
		mcomment = meetingServiceImpl.showCommentMeetingBoard(meeting_boardno);
		for(int i = 0; i<meetingServiceImpl.getCommentCount2(meeting_boardno);i++) {
			if(page==1) {
			if((page-1)*10<=i&&i<=page*10) {
				mcomment2.add(mcomment.get(i));
			}}else {
			if((page-1)*10+1<=i&&i<=page*10) {
				mcomment2.add(mcomment.get(i));
			}}
		}
List<MeetingBoardReview> review = new ArrayList<MeetingBoardReview>();
List<MeetingBoardReview> review2 = new ArrayList<MeetingBoardReview>();
review = meetingServiceImpl.showReview(meeting_boardno);
for(int i = 0; i<meetingServiceImpl.getReviewCount2(meeting_boardno);i++) {
	if(rpage==1) {
	if((rpage-1)*10<=i&&i<=rpage*10) {
		review2.add(review.get(i));
	}}else {
	if((rpage-1)*10+1<=i&&i<=rpage*10) {
		review2.add(review.get(i));
	}}
}		
List<MeetingBoardApply> applylist = meetingServiceImpl.showApply(meeting_boardno);
int applycount;
if(applylist==null) {
	applycount=0;
}else {
	applycount=applylist.size();
}
        model.addAttribute("applylist",applylist);
        model.addAttribute("applycount",applycount);
        model.addAttribute("triapply",triapply);
		model.addAttribute("comment", mcomment2);
		model.addAttribute("corrent", page);
		model.addAttribute("start", meetingServiceImpl.getStartPage(page));
		model.addAttribute("end", meetingServiceImpl.getEndPage(page));
		model.addAttribute("last", meetingServiceImpl.getLastPage(meeting_boardno));
		model.addAttribute("skip",meetingServiceImpl.getSkip(page));
		model.addAttribute("trigge", trigger);
		model.addAttribute("tri", tri);
		model.addAttribute("review", review2);
		model.addAttribute("rcorrent", rpage);
		model.addAttribute("rlast", meetingServiceImpl.getLastPageReview(meeting_boardno));
		return "meeting/meetingView";
	}

	@RequestMapping("writeForm.do") // void !!
	public String meetingWriteForm() {
		return "meeting/meetingWriteForm";
	}
    @RequestMapping("ajaxUpload.do")
    @ResponseBody
    public String ajaxUpload() {
        return "ajaxUpload";
    }
     
    @RequestMapping("fileUpload.do")
    @ResponseBody
    public String fileUp(MultipartHttpServletRequest multi) {         
        // 저장 경로 설정
//        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = "C:/BitCamp/WorkSpace5/PETstFriends/WebContent/img/";
         
        String newFileName = ""; // 업로드 되는 파일명
         
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }     
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
             
            try {
                mFile.transferTo(new File(path+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        MeetingBoard mBoard = new MeetingBoard();
        mBoard = meetingServiceImpl.getCount();
        System.out.println(mBoard);
        mBoard.setMeetingBoard_proPic(newFileName);
        meetingServiceImpl.modifyMeetingBoard(mBoard);
        return "ajaxUpload";
    }

	
	@RequestMapping("writeMBC.do")
	@ResponseBody
	public HashMap<String, Object> writeMBC(@RequestParam String title,
			@RequestParam String startmeetingdate, @RequestParam String startmeetingdate2,
			@RequestParam String endmeetingdate, @RequestParam String endmeetingdate2,
			@RequestParam String startmeetingacceptdate, @RequestParam String startmeetingacceptdate2,
			@RequestParam String endmeetingacceptdate, @RequestParam String endmeetingacceptdate2,
			@RequestParam String content, @RequestParam String place, HttpSession session) {
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
		String userid = (String) session.getAttribute("user_id");
		User user = userServiceImpl.selectUser(userid);
		MeetingBoard mBoard = new MeetingBoard();
		
		mBoard.setBoardname(2);
		 mBoard.setMeetingBoard_userId(userid);//세션 id
		mBoard.setMeetingBoard_title(title);
		mBoard.setMeetingBoard_startMeetingDate(startmeetingdate + " " + startmeetingdate2);
		mBoard.setMeetingBoard_endMeetingDate(endmeetingdate + " " + endmeetingdate2);
		mBoard.setMeetingBoard_startAcceptingDate(startmeetingacceptdate + " " + startmeetingacceptdate2);
		mBoard.setMeetingBoard_endAcceptingDate(endmeetingacceptdate + " " + endmeetingacceptdate2);
		mBoard.setMeetingBoard_place(place);
		mBoard.setMeetingBoard_content(content);
		 mBoard.setMeetingBoard_phone(user.getUser_phone());//세션 전화번호
		 mBoard.setMeetingBoard_email(user.getUser_email());//세션 이메일
		mBoard.setMeetingBoard_readCount(0);
		mBoard.setMeetingBoard_writeDate(date1.format(new Date()));
		 mBoard.setMeetingBoard_nickname(user.getUser_nickname());//세션 닉네임

		meetingServiceImpl.writeMeetingBoard(mBoard);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("meeting", meetingServiceImpl.getCount());
		JSONObject meeting = new JSONObject(result);
		return meeting;
	}

	@RequestMapping("modifyForm.do") // void !!
	public String meetingModifyForm(Model model, @RequestParam int meeting_boardno) {
		model.addAttribute("meeting", meetingServiceImpl.selectMeetingBoard(meeting_boardno));
		return "meeting/meetingModifyForm";
	}

	@RequestMapping("modifyMBC.do")
	@ResponseBody
	public HashMap<String, Object> modifyMBC(@RequestParam int meeting_boardno, @RequestParam String title, @RequestParam String startmeetingdate,
			@RequestParam String endmeetingdate, @RequestParam String startmeetingacceptdate,
			@RequestParam String endmeetingacceptdate, @RequestParam String content, @RequestParam String place, HttpSession session) {
		String userid = (String) session.getAttribute("user_id");
		User user = userServiceImpl.selectUser(userid);
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
		MeetingBoard mBoard = new MeetingBoard();
		mBoard.setMeeting_boardno(meeting_boardno);
		 mBoard.setMeetingBoard_userId(userid);//세션 id
		mBoard.setMeetingBoard_title(title);
		mBoard.setMeetingBoard_startMeetingDate(startmeetingdate);
		mBoard.setMeetingBoard_endMeetingDate(endmeetingdate);
		mBoard.setMeetingBoard_startAcceptingDate(startmeetingacceptdate);
		mBoard.setMeetingBoard_endAcceptingDate(endmeetingacceptdate);
		mBoard.setMeetingBoard_place(place);
		mBoard.setMeetingBoard_content(content);
		 mBoard.setMeetingBoard_phone(user.getUser_phone());//세션 전화번호
		 mBoard.setMeetingBoard_email(user.getUser_email());//세션 이메일
		mBoard.setMeetingBoard_writeDate(date1.format(new Date()));
		 mBoard.setMeetingBoard_nickname(user.getUser_nickname());//세션 닉네임
		meetingServiceImpl.modifyMeetingBoard(mBoard);
		// meetingView - >생성된 게시글 번호가지고
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("meeting", meeting_boardno);
		JSONObject meeting = new JSONObject(result);
		return meeting;
	}

	@RequestMapping("deleteMBC.do")
	public String deleteMBC(@RequestParam int meeting_boardno) {
		meetingServiceImpl.deleteMeetingBoard(meeting_boardno);
		meetingServiceImpl.deleteApply2(meeting_boardno);
		return "redirect:meeting.do";
	}

	@RequestMapping("showMBC.do") // 검색 포함//게시판에서 페이지처리 때문에 추가 작성해야할수도잇음
	@ResponseBody
	public HashMap<String, Object> showMBC(@RequestParam(required = false) String keyword,
			@RequestParam(defaultValue = "0") int type) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		if (type == 1) {
			param.put("meetingBoard_title", keyword);
		} else if (type == 2) {
			param.put("meetingBoard_content", keyword);
		} else if (type == 3) {
			param.put("meetingBoard_title", keyword);
			param.put("meetingBoard_content", keyword);
		} else if (type == 4) {
			param.put("meetingBoard_nickname", keyword);
		} 
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("meetingBoard", meetingServiceImpl.showMeetingBoard(param));
		result.put("count", meetingServiceImpl.getCount().getMeeting_boardno());
		JSONObject meetingBoard = new JSONObject(result);
		return meetingBoard;
	}
	@RequestMapping("showmain.do")
	@ResponseBody
	public HashMap<String, Object> showmain() {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("type", 0);
		List<MeetingBoardApply> apply = new ArrayList<MeetingBoardApply>();
		List<MeetingBoard> apply2= new ArrayList<MeetingBoard>();
		List<MeetingBoardReview> reviewlist = new ArrayList<MeetingBoardReview>(); 
		for(int i = 0; i<meetingServiceImpl.showMeetingBoard(param).size();i++) {
			int boardno = (int) meetingServiceImpl.showMeetingBoard(param).get(i).get("meeting_boardno");
			if(meetingServiceImpl.showApplycount(boardno)!=null) {
			apply.add(meetingServiceImpl.showApplycount(boardno));
			}else {
				if(apply2.size()<4) {
				apply2.add(meetingServiceImpl.selectMeetingBoard(boardno));}}	
			
		   if(reviewlist.size()<4) {
			   for(int it=0; it<meetingServiceImpl.showReview(boardno).size();it++) {
			   reviewlist.add(meetingServiceImpl.showReview(boardno).get(it));
		   }}
		}
		for(int i = 0;i<apply.size();i++) {
			for(int j = 0;j<apply.size()-1;j++) {
				if(apply.get(j).getMeetingBoardApply_count()<apply.get(j+1).getMeetingBoardApply_count()) {
					MeetingBoardApply temp2 = new MeetingBoardApply();
					MeetingBoardApply temp3= new MeetingBoardApply();			
					temp2 = apply.get(j);
					temp3 = apply.get(j+1);
					apply.add(j, temp3);
					apply.remove(j);
					apply.add(j+1, temp2);
					apply.remove(j+1);                    
				}
			}
		}
		List<MeetingBoard> applylist = new ArrayList<MeetingBoard>();
		if(apply.size()==0){
			for(int i = 0 ; i<3;i++) {
			applylist.add(apply2.get(i));
			}
     	}else if(apply.size()==1) {
			applylist.add(meetingServiceImpl.selectMeetingBoard(apply.get(0).getMeeting_boardno()));
			for(int i = 0 ; i<2;i++) {
				applylist.add(apply2.get(i));
				}
			applylist.add(meetingServiceImpl.selectMeetingBoard(apply.get(0).getMeeting_boardno()));
			
		}else if (apply.size()==2) {
			for(int i=0;i<2;i++) {
				applylist.add(meetingServiceImpl.selectMeetingBoard(apply.get(i).getMeeting_boardno()));
			}			
			applylist.add(apply2.get(0));
		}else {
		for(int i=0;i<3;i++) {
			applylist.add(meetingServiceImpl.selectMeetingBoard(apply.get(i).getMeeting_boardno()));
		}
		}
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 후기 좋아요
		List<MeetingLikes> like = new ArrayList<MeetingLikes>();
		List<MeetingLikes> likes = new ArrayList<MeetingLikes>();
		List<MeetingBoardReview> likelist = new ArrayList<MeetingBoardReview>();
        like = meetingServiceImpl.selectcount2();
		if(like.size()==0) {
			for(int i=0;i<3;i++) {
			likelist.add(reviewlist.get(i));
			}
		}else if(like.size()==1) {
	            likelist.add(meetingServiceImpl.selectReview(like.get(0).getMeeting_boardno(),like.get(0).getReviewno()));
	            likes.add(like.get(0));

	            for(int i=0;i<2;i++) {
	    			likelist.add(reviewlist.get(i));

	    			} 
                
		}else if(like.size()==2) {
			for(int i=0;i<2;i++) {
				likelist.add(meetingServiceImpl.selectReview(like.get(i).getMeeting_boardno(),like.get(i).getReviewno()));
				likes.add(like.get(i));
	            }
			likelist.add(reviewlist.get(0));
		}else {
			for(int i=0;i<3;i++) {
				likelist.add(meetingServiceImpl.selectReview(like.get(i).getMeeting_boardno(),like.get(i).getReviewno()));
				likes.add(like.get(i));
            } 
		}
    	MeetingLikes like2 = new MeetingLikes();
		like2.setMeetingLikes_count(0);
		for(int i = 0; i<4;i++) {
		likes.add(like2);
		}

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("meetingBoard", applylist);
		result.put("meetingreview", likelist);
		result.put("meetinglikes", likes);
		JSONObject meetingBoard2 = new JSONObject(result);
		return meetingBoard2;
	} 

	@RequestMapping("selectMBC.do")
	public String selectMBC(Model model, int meeting_boardno) {
		model.addAttribute("meetingBoard", meetingServiceImpl.selectMeetingBoard(meeting_boardno));
		return "meeting/meetingView";
	}

	// 모임신청

	@RequestMapping("insertApplyMBC.do")
	@ResponseBody
	public HashMap<String, Object> insertApplyMBC(@RequestParam int meeting_boardno, HttpSession session) {
		String userid = (String) session.getAttribute("user_id");
		User user = userServiceImpl.selectUser(userid);
		MeetingBoardApply mApply = new MeetingBoardApply();
		mApply.setBoardname(2);
		mApply.setMeeting_boardno(meeting_boardno);
		if(meetingServiceImpl.showApply(meeting_boardno).size()==0) {
			mApply.setMeetingBoardApply_count(1);
		}else {
		mApply.setMeetingBoardApply_count(meetingServiceImpl.showApplycount(meeting_boardno).getMeetingBoardApply_count()+1);}
		mApply.setMeetingBoardApply_email(user.getUser_email());//세션
		mApply.setMeetingBoardApply_nickname(user.getUser_nickname());//세션
		mApply.setMeetingBoardApply_userId(userid);//세션
		meetingServiceImpl.insertApply(mApply);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("boardno",meeting_boardno);
		JSONObject boardno = new JSONObject(result);
		return boardno;
	}

	@RequestMapping("deleteApplyMBC.do")
	@ResponseBody
	public HashMap<String, Object> deleteApplyMBC(@RequestParam int meeting_boardno, HttpSession session) {
		String userid = (String) session.getAttribute("user_id");
		meetingServiceImpl.deleteApply(userid, meeting_boardno);//세션
		List<MeetingBoardApply> mApply = meetingServiceImpl.showApply(meeting_boardno);
		for(int i =0; i<mApply.size();i++) {
			mApply.get(i).setMeetingBoardApply_count(i+1);
		}
		meetingServiceImpl.deleteApply2(meeting_boardno);
		for(int i =0; i<mApply.size();i++) {
		meetingServiceImpl.insertApply(mApply.get(i));
		}
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("boardno",meeting_boardno);
		JSONObject boardno = new JSONObject(result);
		return boardno;
	}

	@RequestMapping("showApplyMBC.do")
	@ResponseBody
	public HashMap<String, Object> showApplyMBC(@RequestParam int meeting_boardno) {
		// int meeting_boardno
		HashMap<String, Object> result = new HashMap<String, Object>();
		JSONObject apply = new JSONObject(result);
		return apply;
	}

	// 모임글 댓글

	@RequestMapping("commentWriteMBC.do")
	@ResponseBody
	public HashMap<String, Object> commentWriteMBC(@RequestParam int meeting_boardno,
			@RequestParam(defaultValue = "0") int meetingComment_commentno,
			@RequestParam(defaultValue = "0") String meetingComment_nickname,
			@RequestParam String meetingComment_content, HttpSession session) {
		String userid = (String) session.getAttribute("user_id");
		User user = userServiceImpl.selectUser(userid);
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
		MeetingComment mComment = new MeetingComment();
		mComment.setBoardname(2);
		mComment.setMeeting_boardno(meeting_boardno);
		if (meetingServiceImpl.getCommentCount2(meeting_boardno) == 0) {
			mComment.setMeetingComment_commentno(1);
			mComment.setMeetingComment_content(meetingComment_content);
			mComment.setMeetingComment_nickname(user.getUser_nickname());// 세션 닉네임
			mComment.setMeetingComment_userId(userid);// 세션 아이디
			mComment.setMeetingComment_writeDate(date1.format(new Date()));
			meetingServiceImpl.commentWriteMeetingBoard(mComment);
		} else if(meetingComment_commentno==0){
			mComment.setMeetingComment_commentno(meetingServiceImpl.getCommentCount(meeting_boardno).getMeetingComment_commentno()+1);
			mComment.setMeetingComment_content(meetingComment_content);
			mComment.setMeetingComment_nickname(user.getUser_nickname());// 세션 닉네임
			mComment.setMeetingComment_userId(userid);// 세션 아이디
			mComment.setMeetingComment_writeDate(date1.format(new Date()));
			meetingServiceImpl.commentWriteMeetingBoard(mComment);
		}else if(meetingComment_commentno!=0) {//답글
				mComment.setMeetingComment_commentno(meetingComment_commentno+1);
				String content = "&nbsp&nbsp" + meetingComment_nickname + "&nbsp" + meetingComment_content;
				mComment.setMeetingComment_content(content);
				mComment.setMeetingComment_nickname(user.getUser_nickname());// 세션 닉네임
				mComment.setMeetingComment_userId(userid);// 세션 아이디
				mComment.setMeetingComment_writeDate(date1.format(new Date()));
				List<MeetingComment> mCommentlist = new ArrayList<MeetingComment>();
				int co1=meetingComment_commentno;
				mCommentlist = meetingServiceImpl.showCommentMeetingBoard(meeting_boardno);
			if(meetingServiceImpl.selectCommentMeetingBoard(meetingComment_commentno, meeting_boardno).getMeetingComment_content().contains("&nbsp&nbsp")) {
				for(int co=meetingComment_commentno; co<=meetingServiceImpl.getCommentCount2(meeting_boardno);co++) {
						if(meetingServiceImpl.showCommentMeetingBoard(meeting_boardno).get(co).getMeetingComment_content().contains("&nbsp&nbsp")) {
							co1++;
						}else {
							mCommentlist.add(co-1, mComment);
							break;
						}
					}
				}else {
					if(meetingServiceImpl.getCommentCount2(meeting_boardno)==1) {
						mCommentlist.add(meetingComment_commentno, mComment);
					}else {
						if(meetingComment_commentno==meetingServiceImpl.getCommentCount2(meeting_boardno)) {
							mCommentlist.add(mComment);
						}else {
								for(int co=meetingComment_commentno+1; co<meetingServiceImpl.getCommentCount2(meeting_boardno);co++) {
										if(meetingServiceImpl.showCommentMeetingBoard(meeting_boardno).get(co).getMeetingComment_content().contains("&nbsp&nbsp")) {
											co1++;
										}else {
											mCommentlist.add(co-1, mComment);
											break;
										}
									}	
							
								
						}

					}
				}
				
				//댓글 여기서부타~~~~~~~~~~~
				for(int i =co1;  i<meetingServiceImpl.getCommentCount2(meeting_boardno);i++) {
						mCommentlist.get(i).setMeetingComment_commentno(i+1);
				}
				System.out.println(mCommentlist);
				for(int i1=1; i1<=mCommentlist.size();i1++) {
					meetingServiceImpl.commentDeleteMeetingBoard(i1, meeting_boardno);
				}
				for(int i2=0; i2<mCommentlist.size();i2++) {
					meetingServiceImpl.commentWriteMeetingBoard(mCommentlist.get(i2));
				}
			}
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			result.put("boardno",meeting_boardno);
			JSONObject boardno = new JSONObject(result);
			return boardno;
	}

	@RequestMapping("commentModifyMBC.do")
	@ResponseBody
	public HashMap<String, Object> commentModifyMBC(@RequestParam int meeting_boardno, @RequestParam int meetingComment_commentno,
			@RequestParam String meetingComment_content, HttpSession session) {
		String userid = (String) session.getAttribute("user_id");
		User user = userServiceImpl.selectUser(userid);
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
		MeetingComment mComment = new MeetingComment();
		mComment.setMeeting_boardno(meeting_boardno);
		mComment.setMeetingComment_commentno(meetingComment_commentno);
		if(meetingServiceImpl.selectCommentMeetingBoard(meetingComment_commentno, meeting_boardno).getMeetingComment_content().contains("&nbsp&nbsp")) {
			mComment.setMeetingComment_content("&nbsp&nbsp"+meetingComment_content);
		}else {
		mComment.setMeetingComment_content(meetingComment_content);
		}
		mComment.setMeetingComment_nickname(user.getUser_nickname());
		mComment.setMeetingComment_writeDate(date1.format(new Date()));
		meetingServiceImpl.commentModifyMeetingBoard(mComment);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("boardno",meeting_boardno);
		JSONObject boardno = new JSONObject(result);
		return boardno;
	}

	@RequestMapping("commentDeleteMBC.do")
	@ResponseBody
	public HashMap<String, Object> commentDeleteMBC(@RequestParam int meeting_boardno, @RequestParam int meetingComment_commentno) {
		meetingServiceImpl.commentDeleteMeetingBoard(meetingComment_commentno, meeting_boardno);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("boardno",meeting_boardno);
		JSONObject boardno = new JSONObject(result);
		return boardno;
	}

	@RequestMapping("reviewView.do") // void !!
	public String reviewview(Model model, @RequestParam int meeting_boardno, @RequestParam int meetingReview_no, @RequestParam(defaultValue = "0") int tri,
			@RequestParam(defaultValue="1") int page, HttpSession session) {
		MeetingBoardReview mReview1 = meetingServiceImpl.selectReview(meeting_boardno, meetingReview_no);
		mReview1.setMeetingReview_count(meetingServiceImpl.selectReview(meeting_boardno, meetingReview_no).getMeetingReview_count()+1);
//		meetingServiceImpl.writeReview(mReview1);
			String user_idCheck = (String) session.getAttribute("user_id");
			model.addAttribute("user_idCheck", user_idCheck);
		model.addAttribute("review", meetingServiceImpl.selectReview(meeting_boardno, meetingReview_no));
		List<ReviewComment> rcomment= new ArrayList<ReviewComment>();
		List<ReviewComment> rcomment2= new ArrayList<ReviewComment>();
		rcomment = meetingServiceImpl.showCommentReview(meeting_boardno, meetingReview_no);
		for(int i = 0; i<meetingServiceImpl.getReviewCommentCount2(meeting_boardno, meetingReview_no);i++) {
			if(page==1) {
			if((page-1)*10<=i&&i<=page*10) {
				rcomment2.add(rcomment.get(i));
			}}else {
			if((page-1)*10+1<=i&&i<=page*10) {
				rcomment2.add(rcomment.get(i));
			}}
		}
		List<MeetingLikes> like = meetingServiceImpl.selectAllReviewLikes(meeting_boardno, meetingReview_no);
		int liken;	
		if(like.size()!=0) {
			liken = meetingServiceImpl.selectAllReviewLikes(meeting_boardno, meetingReview_no).get(like.size()-1).getMeetingLikes_count();	
		}else {
			liken = 0;
		}
		MeetingLikes likeCheck = meetingServiceImpl.selectreviewLikesOne(meeting_boardno, meetingReview_no, user_idCheck);
		if(likeCheck!=null) {
			model.addAttribute("likeCheck", likeCheck);	
		}
		model.addAttribute("likes", liken);
		model.addAttribute("comment", rcomment2);
		model.addAttribute("corrent", page);
		model.addAttribute("start", meetingServiceImpl.getStartPage(page));
		model.addAttribute("end", meetingServiceImpl.getEndPage(page));
		model.addAttribute("last", meetingServiceImpl.getLastPageReviewcomment(meeting_boardno, meetingReview_no));
		model.addAttribute("skip",meetingServiceImpl.getSkip(page));
		model.addAttribute("tri", tri);
		return "meeting/reviewView";
	}

	@RequestMapping("writeReviewForm.do") // void !!
	public String writeReviewForm(Model model, @RequestParam int meeting_boardno) {
		model.addAttribute("meeting_boardno", meeting_boardno);
		return "meeting/writeReviewForm";
	}
	@RequestMapping("modifyReviewForm.do") // void !!
	public String modifyReviewForm(Model model, @RequestParam int meeting_boardno, @RequestParam int meetingReview_no) {
		model.addAttribute("review", meetingServiceImpl.selectReview(meeting_boardno, meetingReview_no));
		return "meeting/modifyReviewForm";
	}

	@RequestMapping("writeReviewMBC.do")
	@ResponseBody
	public HashMap<String, Object> writeReviewMBC(@RequestParam int meeting_boardno,
			@RequestParam String meetingReview_title, @RequestParam String meetingReview_content, HttpSession session) {
		String userid = (String) session.getAttribute("user_id");
		User user = userServiceImpl.selectUser(userid);
		MeetingBoardReview mReview = new MeetingBoardReview();
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
		mReview.setBoardname(1);
		mReview.setMeeting_boardno(meeting_boardno);
		if (meetingServiceImpl.getReviewCount2(meeting_boardno) == 0) {
			mReview.setMeetingReview_no(1);
		} else {
			mReview.setMeetingReview_no(meetingServiceImpl.getReviewCount(meeting_boardno).getMeetingReview_no() + 1);
		}
		mReview.setMeetingReview_title(meetingReview_title);
		mReview.setMeetingReview_content(meetingReview_content);
		 mReview.setMeetingReview_userid(userid);// 세션꺼
		mReview.setMeetingReview_writeDate(date1.format(new Date()));
		 mReview.setMeetingReview_nickname(user.getUser_nickname());//세션꺼
		 mReview.setMeetingReview_count(0);
		meetingServiceImpl.writeReview(mReview);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("boardno",meeting_boardno);
		result.put("reviewno", meetingServiceImpl.getReviewCount(meeting_boardno).getMeetingReview_no());
		JSONObject noo = new JSONObject(result);
		return noo;
	}

	@RequestMapping("modifyReviewMBC.do")
	public String modifyReviewMBC(@RequestParam int meeting_boardno, @RequestParam int meetingReview_no,
			@RequestParam String meetingReview_title, @RequestParam String meetingReview_content, HttpSession session) {
		String userid = (String) session.getAttribute("user_id");
		User user = userServiceImpl.selectUser(userid);
		MeetingBoardReview mReview = new MeetingBoardReview();
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
		mReview.setMeeting_boardno(1);
		mReview.setMeetingReview_no(1);
		mReview.setMeetingReview_title(meetingReview_title);
		mReview.setMeetingReview_content(meetingReview_content);
		mReview.setMeetingReview_userid(userid);
		mReview.setMeetingReview_writeDate(date1.format(new Date()));
		mReview.setMeetingReview_nickname(user.getUser_nickname());
		mReview.setMeetingReview_count(meetingServiceImpl.selectReview(meeting_boardno, meetingReview_no).getMeetingReview_count()+1);
		meetingServiceImpl.modifyReview(mReview);
		return "redirect:testForm.do";
	}

	@RequestMapping("deleteReviewMBC.do")
	public String deleteReviewMBC(@RequestParam int meeting_boardno, @RequestParam int meetingReview_no) {
		meetingServiceImpl.deleteReview(meeting_boardno, meetingReview_no);
		return "redirect:meetingview.do?meeting_boardno="+meeting_boardno+"&trigger=1";
	}

	@RequestMapping("selectReviewMBC.do")
	public ModelAndView selectReviewMBC() {
		// int meeting_boardno, int meetingReview_no
		ModelAndView mav = new ModelAndView();
		MeetingBoardReview result = meetingServiceImpl.selectReview(1, 1);
		mav.addObject(result);
		mav.setViewName("meeting/test");
		return mav;
	}


	// 후기글 댓글

	@RequestMapping("commentWriteReviewMBC.do")
	@ResponseBody
	public HashMap<String, Object> commentWriteReviewMBC(@RequestParam int meeting_boardno,
		@RequestParam int reviewno,
		@RequestParam(defaultValue = "0") int reviewComment_commentno,
		@RequestParam(defaultValue = "0") String reviewComment_nickname,
		@RequestParam String reviewComment_content, HttpSession session) {
		String userid = (String) session.getAttribute("user_id");
		User user = userServiceImpl.selectUser(userid);
	SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
	ReviewComment rComment = new ReviewComment();
	rComment.setBoardname(2);
	rComment.setMeeting_boardno(meeting_boardno);
	rComment.setReviewno(reviewno);
	if (meetingServiceImpl.getReviewCommentCount2(meeting_boardno, reviewno) == 0) {
		rComment.setReviewComment_commentno(1);
		rComment.setReviewComment_content(reviewComment_content);
		rComment.setReviewComment_nickname(user.getUser_nickname());// 세션 닉네임
		rComment.setReviewComment_userId(userid);// 세션 아이디
		rComment.setReviewComment_writeDate(date1.format(new Date()));
		meetingServiceImpl.commentWriteReview(rComment);
	} else if(reviewComment_commentno==0){
		rComment.setReviewComment_commentno(meetingServiceImpl.getReviewCommentCount(meeting_boardno, reviewno).getReviewComment_commentno()+1);
		rComment.setReviewComment_content(reviewComment_content);
		rComment.setReviewComment_nickname(user.getUser_nickname());// 세션 닉네임
		rComment.setReviewComment_userId(userid);// 세션 아이디
		rComment.setReviewComment_writeDate(date1.format(new Date()));
		meetingServiceImpl.commentWriteReview(rComment);
	}else if(reviewComment_commentno!=0) {//답글
			rComment.setReviewComment_commentno(reviewComment_commentno+1);
			String content = "&nbsp&nbsp" + reviewComment_content;
			rComment.setReviewComment_content(content);
			rComment.setReviewComment_nickname(user.getUser_nickname());// 세션 닉네임
			rComment.setReviewComment_userId(userid);// 세션 아이디
			rComment.setReviewComment_writeDate(date1.format(new Date()));
			rComment.setReviewno(reviewno);
			List<ReviewComment> rCommentlist = new ArrayList<ReviewComment>();
			int co1=reviewComment_commentno;
			rCommentlist = meetingServiceImpl.showCommentReview(meeting_boardno, reviewno);
			if(meetingServiceImpl.commentSelectReview(meeting_boardno, reviewComment_commentno, reviewno).getReviewComment_content().contains("&nbsp&nbsp")) {		
			for(int co=reviewComment_commentno; co<=meetingServiceImpl.getReviewCommentCount2(meeting_boardno, reviewno);co++) {
				co1++;
					if(meetingServiceImpl.showCommentReview(meeting_boardno, reviewno).get(co).getReviewComment_content().contains("&nbsp&nbsp")) {
					}else {
						rCommentlist.add(co, rComment);
						break;
					}
				}
			}else {
				rCommentlist.add(reviewComment_commentno, rComment);
			}
			for(int i = meetingServiceImpl.getReviewCommentCount2(meeting_boardno, reviewno); i>0;i--) {
				if(co1<=rCommentlist.get(i).getReviewComment_commentno()) {
					rCommentlist.get(i).setReviewComment_commentno(i+1);
				}
			}
			for(int i1=1; i1<rCommentlist.size();i1++) {
				meetingServiceImpl.commentDeleteReview(meeting_boardno, i1, reviewno);
			}
			for(int i2=0; i2<rCommentlist.size();i2++) {
				meetingServiceImpl.commentWriteReview(rCommentlist.get(i2));
			}
		}
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("boardno",meeting_boardno);
		result.put("reviewno", reviewno);
		JSONObject noo = new JSONObject(result);
		return noo;
	}

	@RequestMapping("commentModifyReviewMBC.do")
	@ResponseBody
	public HashMap<String, Object> commentModifyReviewMBC(@RequestParam int meeting_boardno, @RequestParam int reviewComment_commentno,
				@RequestParam String reviewComment_content, @RequestParam int reviewno, HttpSession session) {
		String userid = (String) session.getAttribute("user_id");
		User user = userServiceImpl.selectUser(userid);
			SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
			ReviewComment rComment = new ReviewComment();
			rComment.setMeeting_boardno(meeting_boardno);
			rComment.setReviewno(reviewno);
			rComment.setReviewComment_commentno(reviewComment_commentno);
			if(meetingServiceImpl.commentSelectReview(meeting_boardno, reviewComment_commentno, reviewno).getReviewComment_content().contains("&nbsp&nbsp")) {
				rComment.setReviewComment_content("&nbsp&nbsp"+reviewComment_content);	
			}else {
			    rComment.setReviewComment_content(reviewComment_content);}
			rComment.setReviewComment_nickname(user.getUser_nickname());
			rComment.setReviewComment_writeDate(date1.format(new Date()));
			meetingServiceImpl.commentModifyReview(rComment);
			HashMap<String, Object> result = new HashMap<String, Object>();
			result.put("boardno",meeting_boardno);
			result.put("reviewno", reviewno);
			JSONObject noo = new JSONObject(result);
			return noo;
	}

	@RequestMapping("commentDeleteReviewMBC.do")
	@ResponseBody
	public HashMap<String, Object> commentDeleteReviewMBC(@RequestParam int meeting_boardno, @RequestParam int reviewComment_commentno,@RequestParam int reviewno) {
		meetingServiceImpl.commentDeleteReview(meeting_boardno, reviewComment_commentno, reviewno);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("boardno",meeting_boardno);
		result.put("reviewno", reviewno);
		JSONObject noo = new JSONObject(result);
		return noo;
	}

	// 후기 좋아요
	@RequestMapping("ReviewLikesMBC.do")
	@ResponseBody
	public HashMap<String, Object> ReviewLikesMBC(@RequestParam int meeting_boardno, @RequestParam int reviewno, HttpSession session) {
		String userid = (String) session.getAttribute("user_id");
		
		MeetingLikes rLikes = new MeetingLikes();
		rLikes.setBoardname(1);
		rLikes.setMeeting_boardno(meeting_boardno);
		int count;
		if(meetingServiceImpl.selectAllReviewLikes(meeting_boardno, reviewno).size()==0) {
			count=1;
		}else {
		    count =(meetingServiceImpl.selectcount(meeting_boardno, reviewno).getMeetingLikes_count()+1);
		}
		
		rLikes.setReviewno(reviewno);
		rLikes.setMeetingLikes_date(new Date());
		rLikes.setMeetingLikes_userId(userid);//세션
		rLikes.setMeetingLikes_count(count);
		meetingServiceImpl.insertReviewLikes(rLikes);
		
		List<MeetingLikes> rLikess = meetingServiceImpl.selectAllReviewLikes(meeting_boardno, reviewno);
		
		meetingServiceImpl.deleteReviewLikes2(meeting_boardno, reviewno);

		for(int i =0; i<rLikess.size();i++) {
		  rLikess.get(i).setMeetingLikes_count(count);
		  meetingServiceImpl.insertReviewLikes(rLikess.get(i));
		}

		List<MeetingLikes> like = meetingServiceImpl.selectAllReviewLikes(meeting_boardno, reviewno);
		int liken = meetingServiceImpl.selectAllReviewLikes(meeting_boardno, reviewno).get(like.size()-1).getMeetingLikes_count();
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("likes", liken);
		
		JSONObject likes = new JSONObject(result);
		return likes;
	}

	@RequestMapping("deleteReviewLikesMBC.do")
	@ResponseBody
	public HashMap<String, Object> deleteReviewLikesMBC(@RequestParam int meeting_boardno, @RequestParam int reviewno, HttpSession session) {
		// int meeting_boardno, int reviewno, String meetingLikes_userId
		String userid = (String) session.getAttribute("user_id");
		meetingServiceImpl.deleteReviewLikes(meeting_boardno, reviewno, userid);//세션
		List<MeetingLikes> like = meetingServiceImpl.selectAllReviewLikes(meeting_boardno, reviewno);
		int liken;		
		HashMap<String, Object> result = new HashMap<String, Object>();
		if(like.size()!=0) {
			liken = meetingServiceImpl.selectAllReviewLikes(meeting_boardno, reviewno).get(like.size()-1).getMeetingLikes_count();	
		}else {
			liken = 0;
		}
		result.put("likes", liken);
		JSONObject likes = new JSONObject(result);
		return likes;
	}



}
