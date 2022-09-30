# modu

modu 1:1 mentoring chating program

# 테스트 전에 하셔야할 것
main.dart에서 home: ChatPage 주석처리, home: RootPage 주석해제

# 하셔야할 것
board_pages 디렉터리의 add_list, all_page, free_page, question_page, tip_page 구현과 answer.dart에 정상적으로 연결

# 디렉터리별 역할
board_pages : 게시판 answer_page.dart랑 이어지는 파일들
chat_pages : chating_page.dart랑 이어지는 파일들(제가 만드는중)
login : 로그인 관련 페이지들 main.dart에서 root_page로 넘겨서 시작해야됨
main_pages : tab_page.dart에 BottomNavigationBarItem에 포함되는 핵심 페이지들

# 파일 단위 역할
- board_pages
  add_list.dart: answer페이지에 연결되는 모든 페이지 하단부에 글 추가 버튼의 기능 구현
  all_page.dart: 전체 글 페이지
  free_page.dart: 자유 글 페이지
  questions_page: 질문 글 페이지
  tip_page.dart: 팁 글 페이지

- chat_pages
  chat_message.dart: 현재 만들고 있는 페이지
  chat_page.dart: 현재 만들고 있는 페이지
  message_list_screen.dart: 화면에 띄워주는 채팅 페이지
  message_model.dart: 채팅 기능 페이지

- login
  loding_page.dart: 로딩 페이지
  login_page.dart: 계정 연동 관련 페이지
  root_page.dart: 연결 상태 페이지

- main_pages
  account_page.dart: 마이페이지
  answer_page.dart: 게시판 커뮤니티
  chating_page.dart: 채팅 페이지
  home_page.dart: 홈 페이지
  search_page.dart: 강사 검색 기능
  tab_page: BottomNavigationBar 페이지 main_pages 파일들을 묶어줌

- 기타 lib디렉터리 밑 파일들
  comment_page, create_page, detail_post_page, feed_widget은 인스타 클론에서 가져온 파일인데 활용가치 있으면 쓰고 아니면 삭제할 예정

firebase_options.dart: firebase에서 flutter앱 플랫폼 추가할때 설치된 파일
main.dart: 메인