
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
			<h2>Öğrenci Ekle</h2>
		</div>
		<!-- Input -->

		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="body">
						<div class="row clearfix">
							<div class="col-sm-12">
								<form action="${pageContext.request.contextPath}/controll"
									method="post">
									<div class="form-group">
										<div class="form-line">
											<input name="numara" type=number class="form-control"
											min=0	placeholder="Numara" required />
										</div>
									</div>
									<div class="form-group">
										<div class="form-line">
											<input name="ad" type="text" class="form-control"
												placeholder="Adı" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-line">
											<input name="soyad" type="text" class="form-control"
												placeholder="Soyadı" />
										</div>
									</div>

									<!-- Radio Button Başlangıcı -->
									<div class="demo-radio-button">
										<input name="ogretim" type="radio" id="radio_1" value="1"
											checked /> <label for="radio_1">1.Öğretim</label> <input
											name="ogretim" type="radio" id="radio_2" value="2" /> <label
											for="radio_2">2.Öğretim</label>
									</div>

									<!-- Radio Button Bİtişi -->
									<div class="form-group">
										<div class="form-line">
											<input name="gun" type="text" class="form-control"
												value="<%Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
			Statement st = con.createStatement();
			String query = "select TamamlanmasiGerekenGun from ayar where id=1";
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {
				out.print(rs.getString("TamamlanmasiGerekenGun"));
			}%>" />
										</div>
									</div>
									<button class="btn btn-primary waves-effect" name="action"
										value="ogrenciEkle">Kaydet</button>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="bottom_section.jsp"></jsp:include>