<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/0661566fd2.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../js/main.js"></script>
<script src="../js/submain.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/submain.css">

<script>
	$(function() {
		// 관광지
		$.ajax({
			url : '/cumtrip/TPhotoUpload.do',
			type : 'get',
			success : function(res) {
				$.each(res, function(i, v) {
					console.log(v.photo_path);

					if (i < 3) {
						str = "<span>";
						str += '<img src="/cumtrip/TPhoto.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '">';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#t1').append(str);
					} else if (i < 6) {
						str = "<span>";
						str += '<img src="/cumtrip/TPhoto.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '">';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#t2').append(str);

					} else if (i < 9) {
						str = "<span>";
						str += '<img src="/cumtrip/TPhoto.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '">';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#t3').append(str);
					}
				})
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
 		// 숙소
		$.ajax({
			url : '/cumtrip/FPhotoUpload.do',
			type : 'get',
			success : function(res) {
				$.each(res, function(i, v) {
					console.log(v.photo_path);

					if (i < 3) {
						str = "<span>";
						str += '<img src="/cumtrip/FPhoto.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '">';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b style="text-align:left">' + v.main_cate + '</b></span>';
						$('#s1').append(str);
					} else if (i < 6) {
						str = "<span>";
						str += '<img src="/cumtrip/FPhoto.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '">';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#s2').append(str);

					} else if (i < 9) {
						str = "<span>";
						str += '<img src="/cumtrip/FPhoto.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '">';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#s3').append(str);
					}
				})
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		}) 
		
		// 음식점
		$.ajax({
			url : '/cumtrip/FPhotoUpload.do',
			type : 'get',
			success : function(res) {
				$.each(res, function(i, v) {
					console.log(v.photo_path);

					if (i < 3) {
						str = "<span>";
						str += '<img src="/cumtrip/FPhoto.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '">';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#f1').append(str);
					} else if (i < 6) {
						str = "<span>";
						str += '<img src="/cumtrip/FPhoto.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '">';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#f2').append(str);

					} else if (i < 9) {
						str = "<span>";
						str += '<img src="/cumtrip/FPhoto.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '">';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#f3').append(str);
					}
				})
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
</script>
</head>

<body>
	<header id="header">
		<!-- 상단 헤더 불러오기 -->
	</header>
	<div id="wrap">

		<contain>
		<section>
			<article>
				<ol class="contain_box">
					<div class="container mt-3">
						<h2>대전 필수사항</h2>

						<div id="myCarousel" class="carousel slide">
							<!-- The slideshow -->
							<div class="l1">
								<span class="att">
									<h4>즐길거리</h4>
									<p>볼 것, 돌아다닐 곳, 체험할 수 있는 명소가 넘쳐납니다.</p> 
									<a href="https://www.tripadvisor.co.kr/Attractions-g297887-Activities-Daejeon.html">모두 보기</a>
								</span>
							</div>

							<div class="carousel-inner l2">
								<div class="carousel-item active" id="t1"></div>
								<div class="carousel-item" id="t2"></div>
								<div class="carousel-item" id="t3"></div>
								<br><br>

								<!-- Indicators 몇 개의 슬라이드가 있고 현재 어느 슬라이드인지 알려주는 부분 -->
								<div class="in">
									<ul class="carousel-indicators">
										<li class="item1 active"></li>
										<li class="item2"></li>
										<li class="item3"></li>
									</ul>
								</div>
							</div> <!-- carousel-inner 끝 -->


							<!-- Left and right controls 이전, 다음 버튼-->
							<a class="carousel-control-prev" href="#myCarousel"> <span
								class="carousel-control-prev-icon"></span>
							</a> <a class="carousel-control-next" href="#myCarousel"> <span
								class="carousel-control-next-icon"></span>
							</a> <!-- 관광지 끝 -->
						</div> <!-- myCarousel 끝 -->


						<div id="myCarousel2" class="carousel slide">
							<!-- The slideshow -->
							<div class="l1">
								<span class="att">
									<h4>숙소</h4>
									<p>매력적이고 현대적인 믿을 수 있는 호텔</p> 
									<a href="https://www.tripadvisor.co.kr/Hotels-g297887-Daejeon-Hotels.html">모두 보기</a>
								</span>
							</div>

							<div class="carousel-inner">
								<div class="carousel-item active" id="s1"></div>
								<div class="carousel-item" id="s2"></div>
								<div class="carousel-item" id="s3"></div>
								<br> <br>

								<!-- Indicators 몇 개의 슬라이드가 있고 현재 어느 슬라이드인지 알려주는 부분 -->
								<div class="in">
									<ul class="carousel-indicators">
										<li class="item1 active"></li>
										<li class="item2"></li>
										<li class="item3"></li>
									</ul>
								</div>
							</div> <!-- carousel-inner 끝-->
						</div> <!-- myCarousel2 끝 -->

						<!-- Left and right controls 이전, 다음 버튼-->
						<a class="carousel-control-prev" href="#myCarousel"> <span
							class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#myCarousel"> <span
							class="carousel-control-next-icon"></span>
						</a> <!-- 숙소 끝 -->


						<div id="myCarousel3" class="carousel slide">
							<!-- The slideshow -->
							<div class="l1">
								<span class="att">
									<h4>음식점</h4>
									<p>먹지 마시고 연회하기 좋은 장소를 놓치지 마세요.</p> 
									<a href="https://www.tripadvisor.co.kr/Restaurants-g297887-Daejeon.html">모두 보기</a>
								</span>
							</div>

							<div class="carousel-inner">
								<div class="carousel-item active" id="f1"></div>
								<div class="carousel-item" id="f2"></div>
								<div class="carousel-item" id="f3"></div>
								<br> <br>

								<!-- Indicators 몇 개의 슬라이드가 있고 현재 어느 슬라이드인지 알려주는 부분 -->
								<div class="in">
									<ul class="carousel-indicators">
										<li class="item1 active"></li>
										<li class="item2"></li>
										<li class="item3"></li>
									</ul>
								</div>
							</div> <!-- carousel-inner -->
						</div> <!-- myCarousel3 끝 -->

						<!-- Left and right controls 이전, 다음 버튼-->
						<a class="carousel-control-prev" href="#myCarousel"> <span
							class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#myCarousel"> <span
							class="carousel-control-next-icon"></span>
						</a> <!-- 음식점 끝 -->
					</div> <!-- container mt-3 끝 -->

				</ol>
			</article>

		</section>

		</contain>

	</div>


	<footer id="footer">
		<!-- 하단불러오기 -->
	</footer>
	<!-- Copyright(c)2021 Hong -->

</body>
</html>