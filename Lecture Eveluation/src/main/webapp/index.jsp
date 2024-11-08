<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>강의평가 웹사이트</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<!-- 네비게이션바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">강의평가 웹 사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">메인</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
						회원관리
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="./userLogin.jsp">로그인</a>
						<a class="dropdown-item" href="./userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="./userLogout.jsp">로그아웃</a>
					</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-ms-2" type="search" placeholder="내용을 입력하세요" aria-label="search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav><!-- 네비게이션바 -->
	
	
	<section class="container">
		<!-- 페이지 상단 컨트롤바 -->
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="LectureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="전공">전공</option>
				<option value="교양">교양</option>
				<option value="기타">기타</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고하기</a>
		</form><!-- 페이지 상단 컨트롤바 -->
		
		<!-- 내용카드 -->
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">컴퓨터개론&nbsp;<small>정민식</small></div>
					<div class="col-4 text-right">
						종합<span style="color : red;">A</span>
					</div>
				</div>
			</div>
			<!-- 내용 -->
			<div class="card-body">
				<h5 class="card-title">
					정말 좋은 강의에요.&nbsp;<small>(2024년 여름학기)</small>
				</h5>
				<p class="card-text">강의가 많이 널널해서, 솔직히 많이 배운건 없는 것 같지만 학점도 잘나오고 좋은 것 같습니다</p>
				<div class="row">
					<div class="col-9 text-left">
						강의력<span style="color : red;">B</span>
						받은성적<span style="color : red;">A</span>
						널널<span style="color : red;">A</span>
						<span style="color: green;">(추천 : 15)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationId=">추천</a>
						<a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationId=">삭제</a>
					</div>
				</div>
			</div><!-- 내용 -->
		</div><!-- 내용카드 -->
	</section>
	
	<!-- 등록하기 모달 창 -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">평가 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-lable="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./evaluationRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>강의명</label>
								<input type="text" name="LectureName" class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-6">
								<label>교수명</label>
								<input type="text" name="professorName" class="form-control" maxlength="20">
							</div>
						</div>
						
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>수강년도</label>
								<select name="lectureYear" id="lectureYear" class="form-control">
									<!-- lectureYearOptionTag(date) -->
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>수강학기</label>
								<select name="semesterDivide" id="semesterDivide" class="form-control">
									<!-- semesterDivideOptionTag(date) -->
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>강의 구분</label>
								<select name="lectureDivide" id="lectureDivide" class="form-control">
									<option value="전공" selected>전공</option>
									<option value="교양">교양</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="evaluationTitle" class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="evaludationContent" class="form-control" maxlength="2028" style="height : 180px;"></textarea>
						</div>
						
						<div class="form-row">
							<div class="form-group col-sm-3">
								<label>종합</label>
								<select name="totalScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>강의력</label>
								<select name="lectureScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>받은 성적</label>
								<select name="creditScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>널널</label>
								<select name="comfortableScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
									<option value="F">F</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div><!-- 등록하기 모달 창 -->
	
	<!-- 신고하기 모달 창 -->
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-lable="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./reportAction.jsp" method="post">
						<div class="form-group">
							<label>신고 제목</label>
							<input type="text" name="reportTitle" class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>신고 내용</label>
							<textarea name="reportContent" class="form-control" maxlength="2028" style="height : 180px;"></textarea>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">신고하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div><!-- 신고하기 모달 창 -->
	
	<!-- 풋터 -->
	<footer class="bg-dark mt-4 p-5 text-center" style="color : #FFFFFF;">
		Copyright &copy; 2018 나동빈 All Rights Reserved.
	</footer><!-- 풋터 -->
	
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script>
		window.onload = function() {
		    const date = new Date();
		    
		    lectureYearOptionTag(date);
		    semesterDivideOptionTag(date);
		};
	
		// lectureYear의 옵션태그 생성
		function lectureYearOptionTag(today){
		    const year = today.getFullYear();
		    let appendHtml = '';
	
		    for(let initYear = 2011; initYear <= year; initYear++){
		        if(initYear === year){
		            appendHtml += '<option value="'+ initYear + '" selected>' + initYear + '</option>';
		        } else{
		            appendHtml += '<option value="'+ initYear + '">' + initYear + '</option>';
		        }
		    }
	
		    document.getElementById('lectureYear').innerHTML = appendHtml;
		}
	
		function semesterDivideOptionTag(today){
		    const month = (today.getMonth()) + 1;
		    let appendHtml = '';
	
		    if(month === 1 || month === 2){
		        appendHtml += '<option name="1학기">1학기</option>';
		        appendHtml += '<option name="여름학기">여름학기</option>';
		        appendHtml += '<option name="2학기">2학기</option>';
		        appendHtml += '<option name="겨울학기" selected>겨울학기</option>';
		    } else if(month === 3 || month === 4 || month === 5 || month === 6){
		        appendHtml += '<option name="1학기" selected>1학기</option>';
		        appendHtml += '<option name="여름학기">여름학기</option>';
		        appendHtml += '<option name="2학기">2학기</option>';
		        appendHtml += '<option name="겨울학기">겨울학기</option>';
		    } else if(month === 7 || month === 8){
		        appendHtml += '<option name="1학기">1학기</option>';
		        appendHtml += '<option name="여름학기" selected>여름학기</option>';
		        appendHtml += '<option name="2학기">2학기</option>';
		        appendHtml += '<option name="겨울학기">겨울학기</option>';
		    } else if(month === 9 || month === 10 || month === 11 || month === 12){
		        appendHtml += '<option name="1학기">1학기</option>';
		        appendHtml += '<option name="여름학기">여름학기</option>';
		        appendHtml += '<option name="2학기" selected>2학기</option>';
		        appendHtml += '<option name="겨울학기">겨울학기</option>';
		    }
	
		    document.getElementById('semesterDivide').innerHTML = appendHtml;
		}
	</script>
</body>
</html>