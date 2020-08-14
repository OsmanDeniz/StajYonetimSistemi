<% if (session.getAttribute("username")==null) response.sendRedirect("../../index.jsp"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:include page="top_section.jsp"></jsp:include>
<link href="../plugins/bootstrap-select/css/bootstrap-select.css"
	rel="stylesheet" />

<section class="content">
	<div class="block-header">
		<h2>Kurum Ekle</h2>
	</div>
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="body">
					<div class="row clearfix">
						<form action="${pageContext.request.contextPath}/controll" method="post">
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control" name="kurumadi"
											placeholder="Kurum Adı" />
									</div>
								</div>
							</div>
							<div class="form-line">
								<!-- Şehirler Combobox -->
								<select class="form-control show-tick" name="sehir">
									<option value="">-- Şehir Seçiniz --</option>
									<%  try{
                                        Class.forName("com.mysql.jdbc.Driver");
                                		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
                                		Statement st = con.createStatement();
                                		String query = "select * from sehirler";
                                		ResultSet rs=st.executeQuery(query);
                                		while(rs.next()){
                                		String name= rs.getString("name");
                                		%>
									<option value="<%=name%>"><%=name%></option>
									<%
                                		}
                                        }catch(Exception e){
                                        	out.print(e.toString());
                                        }%>
								</select>
								<!-- Şehirler Bitişi -->
							</div>
							<br>
							<br>
							<div class="form-line">
								<select class="form-control show-tick" name="calismaAlani">
									<option value="">-- Çalışma Alanı Seçiniz --</option>
									<%  try{
                                        Class.forName("com.mysql.jdbc.Driver");
                                		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
                                		Statement st = con.createStatement();
                                		String query = "select Konu from stajkonusu";
                                		ResultSet rs=st.executeQuery(query);
                                		while(rs.next()){
                                		String name= rs.getString("Konu");
                                		%>
									<option value="<%=name%>"><%=name%></option>
									<%
                                		}
                                        }catch(Exception e){
                                        	out.print(e.toString());
                                        }%>
								</select>
							</div>
							<br>
							<br>
							<div class="col-sm-12">
								<button class="btn btn-primary waves-effect" name="action"
									value="kurumEkle">Kaydet</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</section>
<jsp:include page="bottom_section.jsp"></jsp:include>
