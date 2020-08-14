
<% if (session.getAttribute("username")==null) response.sendRedirect("../../index.jsp"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:include page="top_section.jsp"></jsp:include>

<section class="content">
	<div class="container-fluid">
		<div class="block-header">
			<h2>Kullanıcı Ekle</h2>
		</div>
		<!-- Input -->

		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="body">
						<div class="row clearfix">
							<div class="col-sm-12">
								<form action="${pageContext.request.contextPath}/controll" method="post">
									<div class="col-sm-12">
										<div class="form-group">
											<select class="form-control show-tick" name="komisyon_uyesi"
												required>
												<option value="">-- Komisyon Üyesini Seçiniz --</option>
												<%  try{
					                                        Class.forName("com.mysql.jdbc.Driver");
					                                		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
					                                		Statement st = con.createStatement();
					                                		String query = "select UyeAdi from komisyonuyesi";
					                                		ResultSet rs=st.executeQuery(query);
					                                		while(rs.next()){
					                                		String uyeAdi= rs.getString("UyeAdi");
					                                		%>
												<option value="<%=uyeAdi%>"><%=uyeAdi%></option>
												<%
				                                		}
				                                        }catch(Exception e){
				                                        	out.print(e.toString());
				                                        }
			                                        %>
											</select>
										</div>
									</div>


									<div class="col-sm-3">
										<div class="form-group">
											<div class="form-line">
												<input type="text" class="form-control" name="username"
													placeholder="Kullanıcı Adı" required />
											</div>
										</div>
									</div>

									<div class="col-sm-3">
										<div class="form-group">
											<div class="form-line">
												<input type="password" class="form-control" name="password"
													placeholder="Şifre" required />
											</div>
										</div>
									</div>

									<div class="col-sm-3">
										<div class="form-group">
											<div class="form-line">
												<input type="email" class="form-control" name="email"
													placeholder="Mail Adresi" required />
											</div>
										</div>
									</div>

									<button class="btn btn-primary waves-effect" name="action"
										value="kullanici_ekle">Kaydet</button>
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