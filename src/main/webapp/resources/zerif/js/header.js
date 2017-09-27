function openNav() {
    document.getElementById("mySidenav").style.width = "70%";
    // document.getElementById("flipkart-navbar").style.width = "50%";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.body.style.backgroundColor = "rgba(0,0,0,0)";
}

function changeState(){
	var country = document.searchRoomForm.country.value;
	var state = document.searchRoomForm.state;
	for(var i=state.options.length-1; i >0; i--){
		state.options.remove(i);
	}
	switch(country){
		case '강원도':
			$(state).append('<option>강릉시</option>')
			$(state).append('<option>고성군</option>')
			$(state).append('<option>동해시</option>')
			$(state).append('<option>속초시</option>')
			$(state).append('<option>양양군</option>')
			$(state).append('<option>철원군</option>')
			$(state).append('<option>춘천시</option>')
			$(state).append('<option>평창군</option>')
			$(state).append('<option>홍천군</option>')
			$(state).append('<option>횡성군</option>')
			$(state).append('<option>인제군</option>')
			$(state).append('<option>원주시</option>')
			$(state).append('<option>영월군</option>')
			$(state).append('<option>정선군</option>')
			$(state).append('<option>삼척시</option>')
			$(state).append('<option>화천군</option>')
			break;
		case '경기도':
			$(state).append('<option>가평군</option>')
			$(state).append('<option>강화도</option>')
			$(state).append('<option>광주시</option>')
			$(state).append('<option>남양주시</option>')
			$(state).append('<option>대부도</option>')
			$(state).append('<option>안성시</option>')
			$(state).append('<option>양평군</option>')
			$(state).append('<option>포천시</option>')
			$(state).append('<option>용인시</option>')
			$(state).append('<option>고양시</option>')
			$(state).append('<option>파주시</option>')
			$(state).append('<option>선재도</option>')
			$(state).append('<option>여주시</option>')
			$(state).append('<option>영흥도</option>')
			$(state).append('<option>이천시</option>')
			$(state).append('<option>을왕리</option>')
			$(state).append('<option>연천군</option>')
			$(state).append('<option>양주시</option>')
			$(state).append('<option>안양시</option>')
			$(state).append('<option>옹진군</option>')
			$(state).append('<option>화성시(제부도)</option>')
			break;
		case '충청남도':
			$(state).append('<option>금산군</option>')
			$(state).append('<option>논산시</option>')
			$(state).append('<option>당진군</option>')
			$(state).append('<option>보령시</option>')
			$(state).append('<option>서산시</option>')
			$(state).append('<option>아산시</option>')
			$(state).append('<option>안면도(태안)</option>')
			$(state).append('<option>서천군</option>')
			$(state).append('<option>대전시(공주)</option>')
			$(state).append('<option>예산군</option>')
			$(state).append('<option>세종시</option>')
			$(state).append('<option>부여군</option>')
			break;
		case '충청북도':
			$(state).append('<option>단양군</option>')
			$(state).append('<option>제천시</option>')
			$(state).append('<option>진천군</option>')
			$(state).append('<option>충주시</option>')
			$(state).append('<option>청원군</option>')
			$(state).append('<option>괴산군</option>')
			$(state).append('<option>보은군</option>')
			$(state).append('<option>청주시</option>')
			break;
		case '경상남도':
			$(state).append('<option>거제도</option>')
			$(state).append('<option>산청군</option>')
			$(state).append('<option>통영시</option>')
			$(state).append('<option>하동군</option>')
			$(state).append('<option>남해군</option>')
			$(state).append('<option>밀양시</option>')
			$(state).append('<option>울산시</option>')
			$(state).append('<option>고성군</option>')
			$(state).append('<option>합천군</option>')
			$(state).append('<option>기장군</option>')
			$(state).append('<option>양산시</option>')
			$(state).append('<option>해운대구</option>')
			$(state).append('<option>사천시</option>')
			$(state).append('<option>김해시</option>')
			break;
		case '경상북도':
			$(state).append('<option>경주시</option>')
			$(state).append('<option>문경시</option>')
			$(state).append('<option>울진군</option>')
			$(state).append('<option>포항시</option>')
			$(state).append('<option>영덕군</option>')
			$(state).append('<option>상주시</option>')
			$(state).append('<option>의성군</option>')
			$(state).append('<option>영주시</option>')
			$(state).append('<option>성주군</option>')
			$(state).append('<option>안동시</option>')
			$(state).append('<option>청도군</option>')
			$(state).append('<option>경산시</option>')
			$(state).append('<option>청송군</option>')
			break;
		case '전라남도':
			$(state).append('<option>구례군</option>')
			$(state).append('<option>광양시</option>')
			$(state).append('<option>완도군</option>')
			$(state).append('<option>순천시</option>')
			$(state).append('<option>곡성군</option>')
			$(state).append('<option>장성군</option>')
			$(state).append('<option>해남군</option>')
			$(state).append('<option>고흥군</option>')
			$(state).append('<option>영광군</option>')
			$(state).append('<option>여수시</option>')
			$(state).append('<option>보성군</option>')
			$(state).append('<option>장흥군</option>')
			$(state).append('<option>신안군</option>')
			break;
		case '전라북도':
			$(state).append('<option>무주군</option>')
			$(state).append('<option>부안군</option>')
			$(state).append('<option>완주군</option>')
			$(state).append('<option>정읍시</option>')
			$(state).append('<option>고창군</option>')
			$(state).append('<option>남원시</option>')
			$(state).append('<option>전주시</option>')
			$(state).append('<option>장수군</option>')
			$(state).append('<option>진안군</option>')
			break;
		case '제주도':
			$(state).append('<option>서귀포시</option>')
			$(state).append('<option>제주시</option>')
			break;
		case '서울시':
			$(state).append('<option>서울시</option>')
			break;
	}
		
}