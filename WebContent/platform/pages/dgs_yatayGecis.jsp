<% if (session.getAttribute("username") == null)
	    response.sendRedirect("../../index.jsp");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:include page="top_section.jsp"></jsp:include>
<section class="content">
	<div class="block-header">
		<h2>Dgs-Yatay Geçiş Öğrencisi Ekle</h2>
	</div>
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="body">
					<div class="row clearfix">
						<form action="${pageContext.request.contextPath}/controll" method="post">
							<div class="col-sm-12">
								<div class="form-group">
									<select class="form-control show-tick" name="ogrNo" required>
										<option value="">-- Öğrenci Numarası Seçiniz --</option>
										<%  try{
					                                        Class.forName("com.mysql.jdbc.Driver");
					                                		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
					                                		Statement st = con.createStatement();
					                                		String query = "select Number,Ad,Soyad,Ogretim from ogrenci";
					                                		ResultSet rs=st.executeQuery(query);
					                                		while(rs.next()){
					                                		String numara= rs.getString("Number");
					                                		String ad= rs.getString("Ad");
					                                		String soyad= rs.getString("Soyad");
					                                		String ogretim= rs.getString("Ogretim");
			                                		%>
										<option value="<%=numara%>"><%=numara+" "+ad+" "+soyad+"  --->"+ogretim+".Öğretim"%></option>
										<%
				                                		}
				                                        }catch(Exception e){
				                                        	out.print(e.toString());
				                                        }
			                                        %>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="form-line">
									<input type="text" class="form-control" name="oncekiOkul"
										placeholder="    Önceki Okul" required />
								</div>
							</div>
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control" name="kurumAdi"
											placeholder="Staj yapılan kurum" required />
									</div>
								</div>
								<div class="form-group">

									<div class="form-line">
										<input type="number" class="form-control" name="yapilanGun"
											placeholder="Yapılan Gün" required />
									</div>
								</div>
								<div class="form-group">

									<div class="form-line">
										<input type="text" class="form-control"
											name="kabulEdilecekGun" placeholder="Kabul Edilecek Gün"
											required />
									</div>
								</div>
								<div class="col-sm-12">
									<button class="btn btn-primary waves-effect" name="action"
										value="dgs_yatayGecis">Kaydet</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</section>

<jsp:include page="bottom_section.jsp"></jsp:include>
