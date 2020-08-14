<% 
if (session.getAttribute("username") == null)
    response.sendRedirect("../../index.jsp"); 
%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.Name"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<jsp:include page="top_section.jsp"></jsp:include>

<section class="content">
	<div class="container-fluid">
		<div class="block-header">
			<h2>Öğrenci Güncelle</h2>
		</div>
		<!-- Input -->

		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="body">
						<div class="row clearfix">
							<div class="col-sm-12">
								<form action="ogrenci_guncelle.jsp" method="post">

									<div class="form-group">
										<div class="form-line">
											<!-- numaralar Combobox -->
											<select class="form-control show-tick" name="ogrenci"
												onchange="this.form.submit();">
												<option value="0">-- Öğrenci Seçiniz --</option>
												<%
													try {
														Class.forName("com.mysql.jdbc.Driver");
														Connection con = DriverManager.getConnection(
																"jdbc:mysql://localhost:3306/sbs?autoReconnect=true&useSSL=false", "root", "1994");
														Statement st = con.createStatement();
														String query = "select * from ogrenci order by Number desc";
														ResultSet rs = st.executeQuery(query);
														while (rs.next()) {
															String name = rs.getString("Ad");
															int number = rs.getInt("Number");
												%>
												<option value="<%=number%>"><%=number%></option>
												<%
													}
														con.close();
														rs.close();
													} catch (Exception e) {
														out.print(e.toString());
													}
												%>
											</select>
										</div>
									</div></form>
									<%
										try {

											Class.forName("com.mysql.jdbc.Driver");
											Connection con = DriverManager.getConnection(
													"jdbc:mysql://localhost:3306/sbs?autoReconnect=true&useSSL=false", "root", "1994");
											Statement st = con.createStatement();
											String num = request.getParameter("ogrenci");
											String query = "select * from ogrenci where Number='" + num + "' ";
											ResultSet rs = st.executeQuery(query);
											
											while (rs.next()) {
												//System.out.print(rs.getString("TamamlanmasiGerekenGun"));
									%>
									<form action="${pageContext.request.contextPath}/controll" method="post">
									<div class="form-group">
										<div class="form-line">
											<input name="numara" type="text" class="form-control" value="<%=rs.getString("Number")%>" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-line">
											<input name="ad" type="text" class="form-control" value="<%=rs.getString("Ad")%>" />
										</div>
									</div>
									
									<div class="form-group">
										<div class="form-line">
											<input name="soyad" type="text" class="form-control" value="<%=rs.getString("Soyad")%>" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-line">
											<input name="ogretim" type="text" class="form-control" value="<%=rs.getString("Ogretim")%>" />
										</div>
									</div>
									<div class="col-sm-1">
										<div class="form-group">
											<div class="form-line">
												<button class="btn btn-primary waves-effect" name="action" value="ogrenciGuncelle">Guncelle</button>
											</div>
										</div>
									</div>
									<%
										}
										} catch (Exception e) {
											System.out.print(e.toString());
										}
									%>
									
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
</section>

<jsp:include page="bottom_section.jsp"></jsp:include>