
<%
	if (session.getAttribute("username") == null)
		response.sendRedirect("../../index.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:include page="top_section.jsp"></jsp:include>
<link href="../plugins/bootstrap-select/css/bootstrap-select.css"
	rel="stylesheet" />
<section class="content">
	<div class="container-fluid">
		<div class="block-header">
			<h2>Komisyon Üyesi Sil</h2>
		</div>
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="body">
						<div class="row clearfix">

							<form action="komisyon_uyesi_sil.jsp" method="post">
								<div class="col-sm-12">
									<div class="form-group">
											<select class="form-control show-tick" name="komisyon_adi"
												onchange="this.form.submit();">
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
														out.println("eror" + ex.getMessage());
													}
												%>
											</select>
										</div>
								</div>
							</form>
							<br>
							<br>
							<form action="${pageContext.request.contextPath}/controll"
								method="post" name="action">
								<div class="col-sm-12">
									<div class="form-group">
										<select class="form-control show-tick" name="komisyonUyesi">
											<option value="">-- Komisyon Uyesi Seçiniz --</option>

											<%
												try {

													Class.forName("com.mysql.jdbc.Driver");
													Connection con = DriverManager.getConnection(
															"jdbc:mysql://localhost:3306/sbs?autoReconnect=true&useSSL=false", "root", "1994");
													Statement st = con.createStatement();
													String komisyon = request.getParameter("komisyon_adi");

													if (komisyon != null) {
														String query = "select * from komisyonuyesi where KomisyonAdi='" + komisyon + "'";
														//System.out.print(query+"\n");
														ResultSet rs = st.executeQuery(query);
														while (rs.next()) {

															String id = rs.getString("Uyeid");
															String komisyonn = rs.getString("KomisyonAdi");
															String uyeAdi = rs.getString("Uyeadi");
															//System.out.print(id+komisyonn+uyeAdi);
											%>
											<option value="<%=uyeAdi%>"><%=uyeAdi%></option>
											<%
												}
													}
													con.close();
													st.close();
												} catch (Exception e) {
													out.print(e.toString());
												}
											%>
										</select>
									</div>
								</div>
								<div class="col-sm-1">
									<div class="form-group">
										<div class="form-line">
											<button class="btn btn-primary waves-effect" name="action"
												value="komisyonSil">Sil</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="bottom_section.jsp"></jsp:include>