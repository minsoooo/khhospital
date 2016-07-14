package model;

public class FactoryCommand {
	private FactoryCommand() {
	}

	private static FactoryCommand instance = new FactoryCommand();

	public static FactoryCommand newInstance() {
		return instance;
	}

	public Command createInstance(String cmd) {
		if (cmd.equals("UPDATEDOC")) {
			return new UpdateDocCommand();
		} else if (cmd.equals("UPDATEDOCPROC")) {
			return new UpdateDocProcCommand();
		} else if (cmd.equals("REGDOC")) {
			return new RegDocCommand();
		} else if (cmd.equals("REGDOCPROC")) {
			return new RegDocProcCommand();
		} else if (cmd.equals("REGWORK")) {
			return new RegWorkCommand();
		} else if (cmd.equals("SEARCHDOC")) {
			return new SearchDocCommand();
		} else if (cmd.equals("SEARCHRESULT")) {
			return new SearchResultCommand();
		} else if (cmd.equals("WORK")) {
			return new RegWorkCommand();
		} else if (cmd.equals("DOC")) {
			return new UpdateDocCommand();
		} else if (cmd.equals("UPDATEWORK")) {
			return new UpdateWorkCommand();
		} else if (cmd.equals("SEARCHWORK")) {
			return new SearchWorkCommand();
		} else if (cmd.equals("SEARCHDEPT")) {
			return new SearchDeptCommand();
		} else if (cmd.equals("RESERVE")) {
			return new ReserveCommand();
		} else if (cmd.equals("RESERVEPROC")) {
			return new ReserveProcCommand();
		} else if (cmd.equals("INDEX")) {
			return new IndexCommand();
		} else if (cmd.equals("INTRO")) {
			return new IntroCommand();
		} else if (cmd.equals("LOGIN")) {
			return new LoginCommand();
		} else if (cmd.equals("LOGINPROC")) {
			return new LoginProcCommand();
		} else if (cmd.equals("LOGOUT")) {
			return new LogoutCommand();
		} else if (cmd.equals("REGI")) {
			return new RegiCommand();
		} else if (cmd.equals("REGIPROC")) {
			return new RegiProcCommand();
		}else if (cmd.equals("REGISECOND")) {
			return new RegiSecondCommand();
		} else if (cmd.equals("REGIUPDATE")) {
			return new RegiUpdateCommand();
		} else if (cmd.equals("REGIUPDATEPROC")) {
			return new RegiUpdateProcCommand();
		} else if (cmd.equals("REGIDELETE")) {
			return new RegiDeleteCommand();
		} else if (cmd.equals("REGIDELETEPROC")) {
			return new RegiDeleteProcCommand();
		} else if (cmd.equals("SEARCHID")) {
			return new SearchIdCommand();
		} else if (cmd.equals("SEARCHIDPROC")) {
			return new SearchIdProcCommand();
		} else if (cmd.equals("SEARCHPASS")) {
			return new SearchPassCommand();
		} else if (cmd.equals("SEARCHPASSPROC")) {
			return new SearchPassProcCommand();
		} else if (cmd.equals("CHECKLIST")) {
			return new ChecklistCommand();
		} else if (cmd.equals("CHECKLISTSTART")) {
			return new ChecklistStartCommand();
		} else if (cmd.equals("CHECKLISTPROC")) {
			return new ChecklistProcCommand();
		} else if (cmd.equals("CHECKLISTINSERT")) {
			return new ChecklistInsertCommand();
		} else if (cmd.equals("STEP1")) {
			return new Step1Command();
		} else if (cmd.equals("STEP2")) {
			return new Step2Command();
		} else if (cmd.equals("STEP3")) {
			return new Step3Command();
		} else if (cmd.equals("MGRINDEX")){
			return new MgrIndexCommand();
		} else if (cmd.equals("MYRESERVE")){
			return new MyReserveCommand();
		} else if (cmd.equals("RESERVEDEL")){
			return new ReserveDelCommand();
		}
		//의사용
		 else if (cmd.equals("DOCINDEX")){
				return new DocIndexCommand();
		 }	 else if (cmd.equals("COUNSEL")){
				return new CounselCommand();
		 }	 else if (cmd.equals("STARTCHAT")){
				return new StartChatCommand();
		 }	 else if (cmd.equals("PATCHECKLIST")){
				return new PatChecklistCommand();
		 }	 else if (cmd.equals("ENDCOUNSEL")){
				return new EndCounselCommand();
		 }  
		 	// 6.20 박민수 추가 
		 	else if (cmd.equals("MYWORK")){
			 	return new MyWorkCommand(); 	
		 }	else if (cmd.equals("OPENMEMO")){
			 	return new OpenMemoCommand();
		 } 	else if (cmd.equals("REGMEMO")){
			 	return new RegMemoCommand();
		 } 	else if (cmd.equals("OPENHISTORY")){
			 	return new OpenHistoryCommand();
		 }	else if (cmd.equals("OPENRESERVE")){
			 	return new OpenReserveCommand();
		 }	else if(cmd.equals("DOCRESERVEPROC")){
			 	return new DocReserveProcCommand();
		 }	else if(cmd.equals("REGAD")){
			 	return new RegAdCommand();
		 }	else if(cmd.equals("UPDATEAD")){
			 	return new UpdateAdCommand();
		 }	
		 	// 6월 21일 추가 
		 	else if(cmd.equals("DOCINFOSEARCH")){
				return new DocInfoSearchCommand();
			} else if(cmd.equals("DOCINFODEPT")){
				return new DocInfoDeptCommand();
			}
		 
		 	else if(cmd.equals("MAP")){
				return new MapCommand();
			}else if (cmd.equals("DEPTINDEX")) {
				return new DeptIndexCommand();
			}
			else if(cmd.equals("SITEMAP")){
				return new SitemapCommand();
			}
			
			
			// 외과 게시판 공지사항(N)목록 글읽기, 온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기 
			
		// 외과 게시판 공지사항(N)목록 글읽기, 온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기 
		
			else if(cmd.equals("SURGNBOARDMAIN")){
				return new SurgNBoardCommand();
			}
			
			else if(cmd.equals("SURGNBOARDREAD")){
				return new SurgNBoardReadCommand();
			}
			
			else if(cmd.equals("SURGQBOARDMAIN")){			
				return new SurgQBoardmainCommand();
			}
			else if(cmd.equals("SURGQBOARDWRITE")){			
				return new SurgQBoardWriteCommand();
			}
			else if(cmd.equals("SURGQBOARDWRITEPROC")){			
				return new SurgQBoardWriteProcCommand();
			}
			else if(cmd.equals("SURGQBOARDREAD")){
				return new SurgQBoardReadCommand();
			}
			else if(cmd.equals("SURGQBOARDREPLYPROC")){
				return new SurgQBoardReplyProcCommand();
			}
			else if(cmd.equals("SURGQBOARDREPLYDEL")){
				return new SurgQBoardReplyDelCommand();
			}
			else if(cmd.equals("SURGQBOARDERROR")){
				return new SurgQBoardErrorCommand();
			}
			else if(cmd.equals("SURGQBOARDDELETE")){
				return new SurgQBoardDeleteCommand();
			}
			else if(cmd.equals("SURGQBOARDDELETEPROC")){
				return new SurgQBoardDeleteProcCommand();
			}
			else if(cmd.equals("SURGQBOARDUPDATE")){
				return new SurgQBoardUpdateCommand();
			}		
			else if(cmd.equals("SURGQBOARDUPDATEREAD")){
				return new SurgQBoardUpdateReadCommand();
			}
			else if(cmd.equals("SURGQBOARDUPDATEPROC")){
				return new SurgQBoardUpdateProcCommand();
			}
			// 의사용 외과 게시판  온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기 
			
			else if(cmd.equals("DOCSURGQBOARDMAIN")){			
				return new DocSurgQBoardmainCommand();
			}
			else if(cmd.equals("DOCSURGQBOARDWRITE")){			
				return new DocSurgQBoardWriteCommand();
			}
			else if(cmd.equals("DOCSURGQBOARDWRITEPROC")){			
				return new DocSurgQBoardWriteProcCommand();
			}
			else if(cmd.equals("DOCSURGQBOARDREAD")){
				return new DocSurgQBoardReadCommand();
			}
			else if(cmd.equals("DOCSURGQBOARDREPLYPROC")){
				return new DocSurgQBoardReplyProcCommand();
			}
			else if(cmd.equals("DOCSURGQBOARDREPLYDEL")){
				return new DocSurgQBoardReplyDelCommand();
			}
			else if(cmd.equals("DOCSURGQBOARDERROR")){
				return new DocSurgQBoardErrorCommand();
			}
			else if(cmd.equals("DOCSURGQBOARDDELETE")){
				return new DocSurgQBoardDeleteCommand();
			}
			else if(cmd.equals("DOCSURGQBOARDDELETEPROC")){
				return new DocSurgQBoardDeleteProcCommand();
			}
			else if(cmd.equals("DOCSURGQBOARDUPDATE")){
				return new DocSurgQBoardUpdateCommand();
			}		
			else if(cmd.equals("DOCSURGQBOARDUPDATEREAD")){
				return new DocSurgQBoardUpdateReadCommand();
			}
			else if(cmd.equals("DOCSURGQBOARDUPDATEPROC")){
				return new DocSurgQBoardUpdateProcCommand();
			}
			// 내과 게시판 공지사항(N)목록 글읽기, 온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기
			
			else if(cmd.equals("INTERNBOARDMAIN")){
				return new InterNBoardCommand();
			}
			
			else if(cmd.equals("INTERNBOARDREAD")){
				return new InterNBoardReadCommand();
			}
			
			else if(cmd.equals("INTERQBOARDMAIN")){			
				return new InterQBoardmainCommand();
			}
			else if(cmd.equals("INTERQBOARDWRITE")){			
				return new InterQBoardWriteCommand();
			}
			else if(cmd.equals("INTERQBOARDWRITEPROC")){			
				return new InterQBoardWriteProcCommand();
			}
			else if(cmd.equals("INTERQBOARDREAD")){
				return new InterQBoardReadCommand();
			}
			else if(cmd.equals("INTERQBOARDREPLYPROC")){
				return new InterQBoardReplyProcCommand();
			}
			else if(cmd.equals("INTERQBOARDREPLYDEL")){
				return new InterQBoardReplyDelCommand();
			}
			else if(cmd.equals("INTERQBOARDERROR")){
				return new InterQBoardErrorCommand();
			}
			else if(cmd.equals("INTERQBOARDDELETE")){
				return new InterQBoardDeleteCommand();
			}
			else if(cmd.equals("INTERQBOARDDELETEPROC")){
				return new InterQBoardDeleteProcCommand();
			}
			else if(cmd.equals("INTERQBOARDUPDATE")){
				return new InterQBoardUpdateCommand();
			}		
			else if(cmd.equals("INTERQBOARDUPDATEREAD")){
				return new InterQBoardUpdateReadCommand();
			}
			else if(cmd.equals("INTERQBOARDUPDATEPROC")){
				return new InterQBoardUpdateProcCommand();
			}

			// 의사용 내과 게시판 온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기
					
			else if(cmd.equals("DOCINTERQBOARDMAIN")){		
				return new DocInterQBoardmainCommand();
			}
			else if(cmd.equals("DOCINTERQBOARDWRITE")){			
				return new DocInterQBoardWriteCommand();
			}
			else if(cmd.equals("DOCINTERQBOARDWRITEPROC")){			
				return new DocInterQBoardWriteProcCommand();
			}
			else if(cmd.equals("DOCINTERQBOARDREAD")){
				return new DocInterQBoardReadCommand();
			}
			else if(cmd.equals("DOCINTERQBOARDREPLYPROC")){
				return new DocInterQBoardReplyProcCommand();
			}
			else if(cmd.equals("DOCINTERQBOARDREPLYDEL")){
				return new DocInterQBoardReplyDelCommand();
			}
			else if(cmd.equals("DOCINTERQBOARDERROR")){
				return new DocInterQBoardErrorCommand();
			}
			else if(cmd.equals("DOCINTERQBOARDDELETE")){
				return new DocInterQBoardDeleteCommand();
			}
			else if(cmd.equals("DOCINTERQBOARDDELETEPROC")){
				return new DocInterQBoardDeleteProcCommand();
			}
			else if(cmd.equals("DOCINTERQBOARDUPDATE")){
				return new DocInterQBoardUpdateCommand();
			}		
			else if(cmd.equals("DOCINTERQBOARDUPDATEREAD")){
				return new DocInterQBoardUpdateReadCommand();
			}
			else if(cmd.equals("DOCINTERQBOARDUPDATEPROC")){
				return new DocInterQBoardUpdateProcCommand();
			}
					
			
			// 치과 게시판 공지사항(N)목록 글읽기, 온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기
			
			else if(cmd.equals("DENTNBOARDMAIN")){
				return new DentNBoardCommand();
			}
			
			else if(cmd.equals("DENTNBOARDREAD")){
				return new DentNBoardReadCommand();
			}
			
			else if(cmd.equals("DENTQBOARDMAIN")){			
				return new DentQBoardmainCommand();
			}
			else if(cmd.equals("DENTQBOARDWRITE")){			
				return new DentQBoardWriteCommand();
			}
			else if(cmd.equals("DENTQBOARDWRITEPROC")){			
				return new DentQBoardWriteProcCommand();
			}
			else if(cmd.equals("DENTQBOARDREAD")){
				return new DentQBoardReadCommand();
			}
			else if(cmd.equals("DENTQBOARDREPLYPROC")){
				return new DentQBoardReplyProcCommand();
			}
			else if(cmd.equals("DENTQBOARDREPLYDEL")){
				return new DentQBoardReplyDelCommand();
			}
			else if(cmd.equals("DENTQBOARDERROR")){
				return new DentQBoardErrorCommand();
			}
			else if(cmd.equals("DENTQBOARDDELETE")){
				return new DentQBoardDeleteCommand();
			}
			else if(cmd.equals("DENTQBOARDDELETEPROC")){
				return new DentQBoardDeleteProcCommand();
			}
			else if(cmd.equals("DENTQBOARDUPDATE")){
				return new DentQBoardUpdateCommand();
			}		
			else if(cmd.equals("DENTQBOARDUPDATEREAD")){
				return new DentQBoardUpdateReadCommand();
			}
			else if(cmd.equals("DENTQBOARDUPDATEPROC")){
				return new DentQBoardUpdateProcCommand();
			}		

			// 의사용 치과 게시판  온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기
				
			else if(cmd.equals("DOCDENTQBOARDMAIN")){			
				return new DocDentQBoardmainCommand();
			}
			else if(cmd.equals("DOCDENTQBOARDWRITE")){			
				return new DocDentQBoardWriteCommand();
			}
			else if(cmd.equals("DOCDENTQBOARDWRITEPROC")){			
				return new DocDentQBoardWriteProcCommand();
			}
			else if(cmd.equals("DOCDENTQBOARDREAD")){
				return new DocDentQBoardReadCommand();
			}
			else if(cmd.equals("DOCDENTQBOARDREPLYPROC")){
				return new DocDentQBoardReplyProcCommand();
			}
			else if(cmd.equals("DOCDENTQBOARDREPLYDEL")){
				return new DocDentQBoardReplyDelCommand();
			}
			else if(cmd.equals("DOCDENTQBOARDERROR")){
				return new DocDentQBoardErrorCommand();
			}
			else if(cmd.equals("DOCDENTQBOARDDELETE")){
				return new DocDentQBoardDeleteCommand();
			}
			else if(cmd.equals("DOCDENTQBOARDDELETEPROC")){
				return new DocDentQBoardDeleteProcCommand();
			}
			else if(cmd.equals("DOCDENTQBOARDUPDATE")){
				return new DocDentQBoardUpdateCommand();
			}		
			else if(cmd.equals("DOCDENTQBOARDUPDATEREAD")){
				return new DocDentQBoardUpdateReadCommand();
			}
			else if(cmd.equals("DOCDENTQBOARDUPDATEPROC")){
				return new DocDentQBoardUpdateProcCommand();
			}		
			
			// 안과 게시판 공지사항(N)목록 글읽기, 온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기
			
			else if(cmd.equals("OPTINBOARDMAIN")){
				return new OptiNBoardCommand();
			}
			
			else if(cmd.equals("OPTINBOARDREAD")){
				return new OptiNBoardReadCommand();
			}
			
			else if(cmd.equals("OPTIQBOARDMAIN")){			
				return new OptiQBoardmainCommand();
			}
			else if(cmd.equals("OPTIQBOARDWRITE")){			
				return new OptiQBoardWriteCommand();
			}
			else if(cmd.equals("OPTIQBOARDWRITEPROC")){			
				return new OptiQBoardWriteProcCommand();
			}
			else if(cmd.equals("OPTIQBOARDREAD")){
				return new OptiQBoardReadCommand();
			}
			else if(cmd.equals("OPTIQBOARDREPLYPROC")){
				return new OptiQBoardReplyProcCommand();
			}
			else if(cmd.equals("OPTIQBOARDREPLYDEL")){
				return new OptiQBoardReplyDelCommand();
			}
			else if(cmd.equals("OPTIQBOARDERROR")){
				return new OptiQBoardErrorCommand();
			}
			else if(cmd.equals("OPTIQBOARDDELETE")){
				return new OptiQBoardDeleteCommand();
			}
			else if(cmd.equals("OPTIQBOARDDELETEPROC")){
				return new OptiQBoardDeleteProcCommand();
			}
			else if(cmd.equals("OPTIQBOARDUPDATE")){
				return new OptiQBoardUpdateCommand();
			}		
			else if(cmd.equals("OPTIQBOARDUPDATEREAD")){
				return new OptiQBoardUpdateReadCommand();
			}
			else if(cmd.equals("OPTIQBOARDUPDATEPROC")){
				return new OptiQBoardUpdateProcCommand();
			}		
			
			// 의사용 안과 게시판  온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기
			
			else if(cmd.equals("DOCOPTIQBOARDMAIN")){			
				return new DocOptiQBoardmainCommand();
			}
			else if(cmd.equals("DOCOPTIQBOARDWRITE")){			
				return new DocOptiQBoardWriteCommand();
			}
			else if(cmd.equals("DOCOPTIQBOARDWRITEPROC")){			
				return new DocOptiQBoardWriteProcCommand();
			}
			else if(cmd.equals("DOCOPTIQBOARDREAD")){
				return new DocOptiQBoardReadCommand();
			}
			else if(cmd.equals("DOCOPTIQBOARDREPLYPROC")){
				return new DocOptiQBoardReplyProcCommand();
			}
			else if(cmd.equals("DOCOPTIQBOARDREPLYDEL")){
				return new DocOptiQBoardReplyDelCommand();
			}
			else if(cmd.equals("DOCOPTIQBOARDERROR")){
				return new DocOptiQBoardErrorCommand();
			}
			else if(cmd.equals("DOCOPTIQBOARDDELETE")){
				return new DocOptiQBoardDeleteCommand();
			}
			else if(cmd.equals("DOCOPTIQBOARDDELETEPROC")){
				return new DocOptiQBoardDeleteProcCommand();
			}
			else if(cmd.equals("DOCOPTIQBOARDUPDATE")){
				return new DocOptiQBoardUpdateCommand();
			}		
			else if(cmd.equals("DOCOPTIQBOARDUPDATEREAD")){
				return new DocOptiQBoardUpdateReadCommand();
			}
			else if(cmd.equals("DOCOPTIQBOARDUPDATEPROC")){
				return new DocOptiQBoardUpdateProcCommand();
			}
			
			// 피부과 게시판 공지사항(N)목록 글읽기, 온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기
			
			else if(cmd.equals("SKINNBOARDMAIN")){
				return new SkinNBoardCommand();
			}
			
			else if(cmd.equals("SKINNBOARDREAD")){
				return new SkinNBoardReadCommand();
			}
			
			else if(cmd.equals("SKINQBOARDMAIN")){			
				return new SkinQBoardmainCommand();
			}
			else if(cmd.equals("SKINQBOARDWRITE")){			
				return new SkinQBoardWriteCommand();
			}
			else if(cmd.equals("SKINQBOARDWRITEPROC")){			
				return new SkinQBoardWriteProcCommand();
			}
			else if(cmd.equals("SKINQBOARDREAD")){
				return new SkinQBoardReadCommand();
			}
			else if(cmd.equals("SKINQBOARDREPLYPROC")){
				return new SkinQBoardReplyProcCommand();
			}
			else if(cmd.equals("SKINQBOARDREPLYDEL")){
				return new SkinQBoardReplyDelCommand();
			}
			else if(cmd.equals("SKINQBOARDERROR")){
				return new SkinQBoardErrorCommand();
			}
			else if(cmd.equals("SKINQBOARDDELETE")){
				return new SkinQBoardDeleteCommand();
			}
			else if(cmd.equals("SKINQBOARDDELETEPROC")){
				return new SkinQBoardDeleteProcCommand();
			}
			else if(cmd.equals("SKINQBOARDUPDATE")){
				return new SkinQBoardUpdateCommand();
			}		
			else if(cmd.equals("SKINQBOARDUPDATEREAD")){
				return new SkinQBoardUpdateReadCommand();
			}
			else if(cmd.equals("SKINQBOARDUPDATEPROC")){
				return new SkinQBoardUpdateProcCommand();
			}
			
			// 의사용 피부과 게시판 온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기
			
			else if(cmd.equals("DOCSKINQBOARDMAIN")){			
				return new DocSkinQBoardmainCommand();
			}
			else if(cmd.equals("DOCSKINQBOARDWRITE")){			
				return new DocSkinQBoardWriteCommand();
			}
			else if(cmd.equals("DOCSKINQBOARDWRITEPROC")){			
				return new DocSkinQBoardWriteProcCommand();
			}
			else if(cmd.equals("DOCSKINQBOARDREAD")){
				return new DocSkinQBoardReadCommand();
			}
			else if(cmd.equals("DOCSKINQBOARDREPLYPROC")){
				return new DocSkinQBoardReplyProcCommand();
			}
			else if(cmd.equals("DOCSKINQBOARDREPLYDEL")){
				return new DocSkinQBoardReplyDelCommand();
			}
			else if(cmd.equals("DOCSKINQBOARDERROR")){
				return new DocSkinQBoardErrorCommand();
			}
			else if(cmd.equals("DOCSKINQBOARDDELETE")){
				return new DocSkinQBoardDeleteCommand();
			}
			else if(cmd.equals("DOCSKINQBOARDDELETEPROC")){
				return new DocSkinQBoardDeleteProcCommand();
			}
			else if(cmd.equals("DOCSKINQBOARDUPDATE")){
				return new DocSkinQBoardUpdateCommand();
			}		
			else if(cmd.equals("DOCSKINQBOARDUPDATEREAD")){
				return new DocSkinQBoardUpdateReadCommand();
			}
			else if(cmd.equals("DOCSKINQBOARDUPDATEPROC")){
				return new DocSkinQBoardUpdateProcCommand();
			}		
			
			// 신경과 게시판 공지사항(N)목록 글읽기, 온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기
			
			else if(cmd.equals("PSYNBOARDMAIN")){
				return new PsyNBoardCommand();
			}
			
			else if(cmd.equals("PSYNBOARDREAD")){
				return new PsyNBoardReadCommand();
			}
			
			else if(cmd.equals("PSYQBOARDMAIN")){			
				return new PsyQBoardmainCommand();
			}
			else if(cmd.equals("PSYQBOARDWRITE")){			
				return new PsyQBoardWriteCommand();
			}
			else if(cmd.equals("PSYQBOARDWRITEPROC")){			
				return new PsyQBoardWriteProcCommand();
			}
			else if(cmd.equals("PSYQBOARDREAD")){
				return new PsyQBoardReadCommand();
			}
			else if(cmd.equals("PSYQBOARDREPLYPROC")){
				return new PsyQBoardReplyProcCommand();
			}
			else if(cmd.equals("PSYQBOARDREPLYDEL")){
				return new PsyQBoardReplyDelCommand();
			}
			else if(cmd.equals("PSYQBOARDERROR")){
				return new PsyQBoardErrorCommand();
			}
			else if(cmd.equals("PSYQBOARDDELETE")){
				return new PsyQBoardDeleteCommand();
			}
			else if(cmd.equals("PSYQBOARDDELETEPROC")){
				return new PsyQBoardDeleteProcCommand();
			}
			else if(cmd.equals("PSYQBOARDUPDATE")){
				return new PsyQBoardUpdateCommand();
			}		
			else if(cmd.equals("PSYQBOARDUPDATEREAD")){
				return new PsyQBoardUpdateReadCommand();
			}
			else if(cmd.equals("PSYQBOARDUPDATEPROC")){
				return new PsyQBoardUpdateProcCommand();
			}		

			// 의사용 신경과 게시판 온라인질문(Q) 글쓰기,DB추가,글읽기, 댓글추가삭제,에러페이지,글삭제,수정하기
					
			else if(cmd.equals("DOCPSYQBOARDMAIN")){			
				return new DocPsyQBoardmainCommand();
			}
			else if(cmd.equals("DOCPSYQBOARDWRITE")){			
				return new DocPsyQBoardWriteCommand();
			}
			else if(cmd.equals("DOCPSYQBOARDWRITEPROC")){			
				return new DocPsyQBoardWriteProcCommand();
			}
			else if(cmd.equals("DOCPSYQBOARDREAD")){
				return new DocPsyQBoardReadCommand();
			}
			else if(cmd.equals("DOCPSYQBOARDREPLYPROC")){
				return new DocPsyQBoardReplyProcCommand();
			}
			else if(cmd.equals("DOCPSYQBOARDREPLYDEL")){
				return new DocPsyQBoardReplyDelCommand();
			}
			else if(cmd.equals("DOCPSYQBOARDERROR")){
				return new DocPsyQBoardErrorCommand();
			}
			else if(cmd.equals("DOCPSYQBOARDDELETE")){
				return new DocPsyQBoardDeleteCommand();
			}
			else if(cmd.equals("DOCPSYQBOARDDELETEPROC")){
				return new DocPsyQBoardDeleteProcCommand();
			}
			else if(cmd.equals("DOCPSYQBOARDUPDATE")){
				return new DocPsyQBoardUpdateCommand();
			}		
			else if(cmd.equals("DOCPSYQBOARDUPDATEREAD")){
				return new DocPsyQBoardUpdateReadCommand();
			}
			else if(cmd.equals("DOCPSYQBOARDUPDATEPROC")){
				return new DocPsyQBoardUpdateProcCommand();
			}			
			
			// 메인 인덱스 문의하기 게시판 - 메인,글쓰기,글읽기,댓글달기,댓글삭제,글비번,글삭제,글수정
			
			else if(cmd.equals("QBOARDMAIN")){			
				return new QBoardmainCommand();
			}
			else if(cmd.equals("QBOARDWRITE")){			
				return new QBoardWriteCommand();
			}
			else if(cmd.equals("QBOARDWRITEPROC")){			
				return new QBoardWriteProcCommand();
			}
			else if(cmd.equals("QBOARDREAD")){
				return new QBoardReadCommand();
			}
			else if(cmd.equals("QBOARDREPLYPROC")){
				return new QBoardReplyProcCommand();
			}
			else if(cmd.equals("QBOARDREPLYDEL")){
				return new QBoardReplyDelCommand();
			}
			else if(cmd.equals("QBOARDERROR")){
				return new QBoardErrorCommand();
			}
			else if(cmd.equals("QBOARDDELETE")){
				return new QBoardDeleteCommand();
			}
			else if(cmd.equals("QBOARDDELETEPROC")){
				return new QBoardDeleteProcCommand();
			}
			else if(cmd.equals("QBOARDUPDATE")){
				return new QBoardUpdateCommand();
			}		
			else if(cmd.equals("QBOARDUPDATEREAD")){
				return new QBoardUpdateReadCommand();
			}
			else if(cmd.equals("QBOARDUPDATEPROC")){
				return new QBoardUpdateProcCommand();
			}
			
			// 메인 인덱스 간병인을 구합니다 게시판 메인,글쓰기,글읽기,댓글달기,댓글삭제,글비번,글삭제,글수정

			else if(cmd.equals("ADBOARDMAIN")){			
				return new ADBoardmainCommand();
			}
			else if(cmd.equals("ADBOARDWRITE")){			
				return new ADBoardWriteCommand();
			}
			else if(cmd.equals("ADBOARDWRITEPROC")){			
				return new ADBoardWriteProcCommand();
			}
			else if(cmd.equals("ADBOARDREAD")){			
				return new ADBoardReadCommand();
			}
			else if(cmd.equals("ADBOARDREPLYPROC")){
				return new ADBoardReplyProcCommand();
			}
			else if(cmd.equals("ADBOARDREPLYDEL")){
				return new ADBoardReplyDelCommand();
			}
			else if(cmd.equals("ADBOARDERROR")){
				return new ADBoardErrorCommand();
			}
			else if(cmd.equals("ADBOARDDELETE")){
				return new ADBoardDeleteCommand();
			}
			else if(cmd.equals("ADBOARDDELETEPROC")){
				return new ADBoardDeleteProcCommand();
			}
			else if(cmd.equals("ADBOARDUPDATE")){
				return new ADBoardUpdateCommand();
			}		
			else if(cmd.equals("ADBOARDUPDATEREAD")){
				return new ADBoardUpdateReadCommand();
			}
			else if(cmd.equals("ADBOARDUPDATEPROC")){
				return new ADBoardUpdateProcCommand();
			}
			
			// 공지사항(NOTICE)게시판 목록,글쓰기,글읽기,글삭제,수정하기
			
			else if(cmd.equals("MGRNOTICEBOARDMAIN")){
				return new MgrNoticeBoardmainCommand();
			}
			else if(cmd.equals("MGRNOTICEBOARDWRITE")){			
				return new MgrNoticeBoardWriteCommand();
			}
			else if(cmd.equals("MGRNOTICEBOARDWRITEPROC")){			
				return new MgrNoticeBoardWriteProcCommand();
			}
			else if(cmd.equals("MGRNOTICEBOARDREAD")){
				return new MgrNoticeBoardReadCommand();
			}
			else if(cmd.equals("MGRNOTICEBOARDDELETEPROC")){
				return new MgrNoticeBoardDeleteProcCommand();
			}
			else if(cmd.equals("MGRNOTICEBOARDUPDATE")){
				return new MgrNoticeBoardUpdateCommand();
			}				
			else if(cmd.equals("MGRNOTICEBOARDUPDATEPROC")){
				return new MgrNoticeBoardUpdateProcCommand();
			}		
					
			// 자주묻는질문 (OQ) 게시판 목록,글쓰기,글읽기,글삭제,수정하기
			
			else if(cmd.equals("MGROQBOARDMAIN")){
				return new MgrOQBoardmainCommand();
			}		
			else if(cmd.equals("MGROQBOARDWRITE")){			
				return new MgrOQBoardWriteCommand();
			}
			else if(cmd.equals("MGROQBOARDWRITEPROC")){			
				return new MgrOQBoardWriteProcCommand();
			}		
			else if(cmd.equals("MGROQBOARDREAD")){
				return new MgrOQBoardReadCommand();
			}		
			else if(cmd.equals("MGROQBOARDDELETEPROC")){
				return new MgrOQBoardDeleteProcCommand();
			}		
			else if(cmd.equals("MGROQBOARDUPDATE")){
				return new MgrOQBoardUpdateCommand();
			}				
			else if(cmd.equals("MGROQBOARDUPDATEPROC")){
				return new MgrOQBoardUpdateProcCommand();
			}		

			// 병원뉴스(InternalNews)게시판 목록,글쓰기,글읽기,글삭제,수정하기
			
			else if(cmd.equals("MGRINTERNALNEWSBOARDMAIN")){			
				return new MgrInternalNewsBoardmainCommand();
			}
			else if(cmd.equals("MGRINTERNALNEWSBOARDWRITE")){			
				return new MgrInternalNewsBoardWriteCommand();
			}
			else if(cmd.equals("MGRINTERNALNEWSBOARDWRITEPROC")){		
				return new MgrInternalNewsBoardWriteProcCommand();
			}
			else if(cmd.equals("MGRINTERNALNEWSBOARDREAD")){
				return new MgrInternalNewsBoardReadCommand();
			}
			else if(cmd.equals("MGRINTERNALNEWSBOARDDELETEPROC")){
				return new MgrInternalNewsBoardDeleteProcCommand();
			}
			else if(cmd.equals("MGRINTERNALNEWSBOARDUPDATE")){
				return new MgrInternalNewsBoardUpdateCommand();
			}				
			else if(cmd.equals("MGRINTERNALNEWSBOARDUPDATEPROC")){
				return new MgrInternalNewsBoardUpdateProcCommand();
			}
			
			// 관련 뉴스 
			
			else if(cmd.equals("MGRMEDICALNEWSBOARDMAIN")){			
				return new MgrMedicalNewsBoardmainCommand();
			}
			else if(cmd.equals("MGRMEDICALNEWSBOARDWRITE")){			
				return new MgrMedicalNewsBoardWriteCommand();
			}
			else if(cmd.equals("MGRMEDICALNEWSBOARDWRITEPROC")){		
				return new MgrMedicalNewsBoardWriteProcCommand();
			}
			else if(cmd.equals("MGRMEDICALNEWSBOARDREAD")){
				return new MgrMedicalNewsBoardReadCommand();
			}
			else if(cmd.equals("MGRMEDICALNEWSBOARDDELETEPROC")){
				return new MgrMedicalNewsBoardDeleteProcCommand();
			}
			else if(cmd.equals("MGRMEDICALNEWSBOARDUPDATE")){
				return new MgrMedicalNewsBoardUpdateCommand();
			}				
			else if(cmd.equals("MGRMEDICALNEWSBOARDUPDATEPROC")){
				return new MgrMedicalNewsBoardUpdateProcCommand();
			}

		return null;
		
	}

}
