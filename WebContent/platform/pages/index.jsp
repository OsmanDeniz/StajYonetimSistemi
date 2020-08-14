
<% if (session.getAttribute("username")==null) response.sendRedirect("../../index.jsp"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<jsp:include page="top_section.jsp"></jsp:include>



<section class="content">
	<div class="container-fluid">
		<div class="block-header">
			<h2>Yönetim</h2>
		</div>
		<!-- Widgets -->
		<div class="row clearfix">
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="info-box bg-pink hover-expand-effect">
					<div class="icon">
						<i class="material-icons">playlist_add_check</i>
					</div>
					<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
Statement st = con.createStatement();
String randevuSayisi = "Select Count(ogrenciNo) as randevuSayisi from randevu where StajDegerlendirildi=0";
String ogrenciSayisi= "Select count(*) as ogrenciSayisi from ogrenci where StajiBittiMi=0";
String kurumSayisi="select count(*) as kurumSayisi from kurumlar";
ResultSet rs=st.executeQuery(randevuSayisi);

while(rs.next()){
%>
					<div class="content">
						<div class="text">Kalan Mülakat Sayısı</div>
						<div class="number count-to" data-from="0"
							data-to="<%= rs.getString("randevuSayisi") %>" data-speed="15"
							data-fresh-interval="20"></div>
					</div>
				</div>
			</div>

			<%} ResultSet rs1= st.executeQuery(ogrenciSayisi);
	while(rs1.next()){
%>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="info-box bg-orange hover-expand-effect">
					<div class="icon">
						<i class="material-icons">access_alarm</i>
					</div>
					<div class="content">
						<div class="text">Stajı Bitmemiş Toplam Öğrenci</div>
						<div class="number count-to" data-from="0"
							data-to="<%= rs1.getString("ogrenciSayisi") %>" data-speed="1000"
							data-fresh-interval="20"></div>
					</div>
				</div>
			</div>
		
		<%}
	ResultSet rs2=st.executeQuery(kurumSayisi);
	while(rs2.next()){
	%>
		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
			<div class="info-box bg-blue hover-zoom-effect">
				<div class="icon">
					<i class="material-icons">devices</i>
				</div>
				<div class="content">
					<div class="text">Kurum Sayisi</div>
					<div class="number"><%= rs2.getString("kurumSayisi") %></div>
				</div>
			</div>
		</div>
		<%} 
	String komisyonUyeSayisi= "Select count(*) as komisyonuye from komisyonuyesi";
	ResultSet rs3=st.executeQuery(komisyonUyeSayisi);
	while(rs3.next()){
	%>
		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
			<div class="info-box bg-yellow hover-zoom-effect">
				<div class="icon">
					<i class="material-icons">person</i>
				</div>
				<div class="content">
					<div class="text">Komisyon Üyesi</div>
					<div class="number"><%= rs3.getString("komisyonuye") %></div>
				</div>
			</div>
		</div>
		<%} %>
		<p>.<br><br><br>.<br><br><br>.<br><br><br>.</p>
		<p>342130 Osman Deniz </p>
		<p>340824 Emre Özdemir </p>
		<p>294991 Mahsum Yatkı </p>
		
		<p>Not: Bu uygulama minimum özellikleri karşılamak amacıyla yazılmış olup, gerçekte kullanılmak istenildiğinde gerekli opmizasyonlar yapılarak kullanıma sunulacaktır. </p>
		<!-- #END# Widgets -->
		</div>
</section>

<jsp:include page="bottom_section.jsp"></jsp:include>