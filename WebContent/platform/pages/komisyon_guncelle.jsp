<% 
if (session.getAttribute("username") == null)
    response.sendRedirect("../../index.jsp"); 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*"%>
<jsp:include page="top_section.jsp"></jsp:include>
<section class="content">
	<div class="container-fluid">
		<div class="block-header">
			<h2>Komisyon Güncelle</h2>
		</div>
		
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="body">
						<div class="row clearfix">
							<form action="${pageContext.request.contextPath}/controll" method="post">

								<div class="col-sm-6">
									<div class="form-group">
											<select class="form-control show-tick" name="eskiKomisyon">
												<option value="">-- Komisyon Seçiniz --</option>
												<%
													try {
														Class.forName("com.mysql.jdbc.Driver");
														Connection con = DriverManager.getConnection(
																"jdbc:mysql://localhost:3306/sbs?autoReconnect=true&useSSL=false", "root", "1994");
														Statement st = con.createStatement();
														String query = "select * from komisyon order by KomisyonAdi desc";
														ResultSet rs = st.executeQuery(query);
														while (rs.next()) {
												%>
												<option value="<%=rs.getString("KomisyonAdi")%>"><%=rs.getString("KomisyonAdi")%></option>
												<%
													}
														con.close();
														st.close();
													} catch (Exception ex) {
														ex.printStackTrace();
														out.println("error" + ex.getMessage());
													}
												%>
											</select>
										</div>
									
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<div class="form-line">
											<input type="text" class="form-control" name="yeniKomisyon"
												placeholder="Güncel Komisyon adı" />
										</div>
									</div>
								</div>

								<div class="col-sm-1">
									<div class="form-group">
										<div class="form-line">
											<button class="btn btn-primary waves-effect" name="action"
												value="komisyonGuncelle">Güncelle</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>
<jsp:include page="bottom_section.jsp"></jsp:include>