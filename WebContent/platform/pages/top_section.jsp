
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>Staj Bilgi Yönetim Sistemi</title>
<!-- Favicon-->
<link rel="icon" href="favicon.ico" type="image/x-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" type="text/css">

<!-- Bootstrap Select Css -->
<link href="../plugins/bootstrap-select/css/bootstrap-select.css"
	rel="stylesheet" />

<!-- Bootstrap Core Css -->
<link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Waves Effect Css -->
<link href="../plugins/node-waves/waves.css" rel="stylesheet" />

<!-- Animation Css -->
<link href="../plugins/animate-css/animate.css" rel="stylesheet" />


<!-- JQuery DataTable Css -->
<link
	href="../plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css"
	rel="stylesheet">


<!-- Bootstrap Material Datetime Picker Css -->
<link
	href="../plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
	rel="stylesheet" />


<!-- Custom Css -->
<link href="../css/style.css" rel="stylesheet">

<!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="../css/themes/all-themes.css" rel="stylesheet" />
</head>

<body class="theme-red">
	<!-- Page Loader -->
	<div class="page-loader-wrapper">
		<div class="loader">
			<div class="preloader">
				<div class="spinner-layer pl-red">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
			<p>Lütfen Bekleyin...</p>
		</div>
	</div>
	<!-- #END# Page Loader -->
	<!-- Overlay For Sidebars -->
	<div class="overlay"></div>
	<!-- #END# Overlay For Sidebars -->
	<!-- Top Bar -->
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#navbar-collapse" aria-expanded="false"></a> <a
					class="bars"></a> <a class="navbar-brand" href="index.jsp">Staj
					Bilgi Yönetim Sistemi</a>
			</div>
		</div>
	</nav>
	<!-- #Top Bar -->
	<section>
		<!-- Left Sidebar -->
		<aside id="leftsidebar" class="sidebar">
			<!-- User Info -->
			<div class="user-info">
				<div class="image">
					<img src="../images/user.png" width="48" height="48" alt="User" />
				</div>
				<div class="info-container">
					<div class="name" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><%= session.getAttribute("nameSurname") %></div>
					<div class="email"><%= session.getAttribute("email") %></div>
					<div class="btn-group user-helper-dropdown">
						<i class="material-icons" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
						<ul class="dropdown-menu pull-right">
							<li><a href="userProfile.jsp"><i class="material-icons">person</i>Profil</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="signout.jsp"><i class="material-icons">input</i>Çıkış
									Yap</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- #User Info -->
			<!-- Menu -->
			<div class="menu">
				<ul class="list">
					<li class="header">Menüler</li>
					<li class="active"><a href="index.jsp"> <i
							class="material-icons">home</i> <span>Anasayfa</span>
					</a></li>
					<li><a class="menu-toggle waves-effect waves-block"> <i
							class="material-icons">view_list</i> <span>Ekle</span>
					</a> <!-- Ekleme Menüsü Başlangıcı  -->
						<ul class="ml-menu">
							<li><a href="dgs_yatayGecis.jsp"
								class=" waves-effect waves-block">Dgs/Yatay Geçiş Öğrencisi
									Ekle</a></li>
							<li><a href="komisyon_ekle.jsp"
								class=" waves-effect waves-block">Komisyon Ekle</a></li>
							<li><a href="komisyon_uyesi_ekle.jsp"
								class=" waves-effect waves-block">Komisyon Üyesi Ekle</a></li>
							<li><a href="kurum_ekle.jsp"
								class=" waves-effect waves-block">Kurum Ekle</a></li>
							<li><a href="mulakat_ekle.jsp"
								class=" waves-effect waves-block">Mülakat Ekle</a></li>
							<li><a href="ogrenci_ekle.jsp"
								class=" waves-effect waves-block">Öğrenci Ekle</a></li>

							<li><a href="randevu_ekle.jsp"
								class=" waves-effect waves-block">Randevu Ekle</a></li>

							<li><a href="stajkonusu_ekle.jsp"
								class=" waves-effect waves-block">Staj Konusu Ekle</a></li>

							<li><a href="kullanici_ekle.jsp"
								class=" waves-effect waves-block">Kullanıcı Ekle</a></li>

						</ul> <!-- Ekleme Menüsü Bitişi --></li>
						<li>
                       <a class="menu-toggle waves-effect waves-block">
                            <i class="material-icons">view_list</i>
                            <span>Silme ve Güncelleme</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="randevu_guncelle.jsp" class=" waves-effect waves-block"> Randevu Guncelle</a>
                            </li>

                            <li>
                                <a href="ogrenci_guncelle.jsp" class=" waves-effect waves-block"> Öğrencileri Guncelle </a>
                            </li>
                            <li>
                                <a href="komisyon_guncelle.jsp" class=" waves-effect waves-block"> Komisyon Guncelle</a>
                            </li>
                            <li>
                                <a href="komisyon_uyesi_sil.jsp" class=" waves-effect waves-block"> Komisyon Uyesi Sil </a>
                            </li>
</ul>                        
                    </li>

					<li><a class="menu-toggle waves-effect waves-block"> <i
							class="material-icons">view_list</i> <span>Listele</span></a>
						<ul class="ml-menu">
							<li><a href="kurum_listele.jsp"
								class=" waves-effect waves-block"> Kurum Listele </a></li>
							<li><a href="mulakat_listele.jsp"
								class=" waves-effect waves-block"> Mülakat Listele </a></li>
							<li><a href="ogrenci_listele.jsp"
								class=" waves-effect waves-block"> Öğrencileri Listele </a></li>
							<li><a href="randevu_listele.jsp"
								class=" waves-effect waves-block"> Randevu Listele </a></li>
							<li><a href="staji_biten_ogrenciler.jsp"
								class=" waves-effect waves-block"> Stajı Biten Öğrencileri
									Listele </a></li>
						</ul></li>



					<li><a class="menu-toggle waves-effect waves-block"> <i
							class="material-icons">view_list</i> <span>Ayarlar</span>
					</a>
						<ul class="ml-menu">
							<li><a href="tamamlanacakGun.jsp"
								class=" waves-effect waves-block">Tamamlanması Gereken Gün</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- #Menu -->

		</aside>
		<!-- #END# Left Sidebar -->
	</section>
