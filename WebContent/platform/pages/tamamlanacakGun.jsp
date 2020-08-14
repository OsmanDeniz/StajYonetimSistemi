
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
			<h2>Tamamlanacak Gün Sayısını Güncelle</h2>
		</div>
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="body">
						<div class="row clearfix">
							<form action="${pageContext.request.contextPath}/controll"
								method="post">
								<div class="col-sm-8">
									<div class="form-group">
										<div class="form-line">
											<br> <br> <input type="text" class="form-control"
												name="gun" placeholder="Gün"
												value="<%
												try {
														Class.forName("com.mysql.jdbc.Driver");
														Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root","1994");
														Statement st = con.createStatement();
														String query = "select TamamlanmasiGerekenGun from ayar where id=1";
														ResultSet rs = st.executeQuery(query);
														while (rs.next()) {%><%=rs.getString("TamamlanmasiGerekenGun")%><%}
														} catch (Exception e) {
															out.print(e.toString());
														}%>" />
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<button class="btn btn-primary waves-effect" name="action"
										value="tamamlanacakGunEkle">Kaydet</button>
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