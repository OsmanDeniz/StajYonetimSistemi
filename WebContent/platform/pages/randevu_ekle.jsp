<% if (session.getAttribute("username")==null) response.sendRedirect("../../index.jsp"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<jsp:include page="top_section.jsp"></jsp:include>
<section class="content">
	<div class="block-header">
		<h2>Randevu Ekle</h2>
	</div>
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="body">
					<div class="row clearfix">
						<form action="${pageContext.request.contextPath}/controll" method="post" name="action">
							<br>
							<br>
							<div class="col-sm-12">
								<div class="form-group">
									<select class="form-control show-tick" name="Number">
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
                                        }%>

									</select>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<input type="text" id="date" name="tarih"
											class="datepicker form-control floating-label"
											placeholder="Tarih Seçiniz..." required	/>
									</div>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="timepicker form-control"
											placeholder="Saat Seçiniz..." name="saat" required />
									</div>
								</div>
							</div>

							<div class="col-sm-12">
								<select class="form-control show-tick" name="komisyon">
									<option value="">-- Komisyon Seçiniz --</option>
									<%
                                        try{
                                        	Class.forName("com.mysql.jdbc.Driver");
                                    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
                                    		Statement st = con.createStatement();
                                    		String query = "select * from komisyon ORDER BY KomisyonAdi DESC";
                                    		ResultSet rs=st.executeQuery(query);
                                    		while(rs.next()){
                                    			%>
									<option value="<%=rs.getString("KomisyonAdi")%>"><%=rs.getString("KomisyonAdi")%></option>
									<%
                                    			}
                                    		}
                                    		catch(Exception ex)
                                    		{
                                    		ex.printStackTrace();
                                    		out.println("error"+ex.getMessage());
                                    		}
                                    		%>
								</select>
							</div>
							<br>
							<br>
							<br>
							<div class="col-sm-1">
								<div class="form-group">
									<div class="form-line">
										<button class="btn btn-primary waves-effect" name="action"
											value="randevu_ekle">Kaydet</button>
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


	<!-- Custom js de basic form js dosyası calıstırılması gerekiyor bottomda çakışma yaptığından buraya eklendi -->
    <!-- Jquery Core Js -->
    <script src="../plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="../plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="../plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../plugins/node-waves/waves.js"></script>

    <!-- Autosize Plugin Js -->
    <script src="../plugins/autosize/autosize.js"></script>

    <!-- Moment Plugin Js -->
    <script src="../plugins/momentjs/moment.js"></script>

    <!-- Bootstrap Material Datetime Picker Plugin Js -->
    <script src="../plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
  
    <!-- Custom Js -->
    <script src="../js/admin.js"></script>
    <script src="../js/pages/forms/basic-form-elements.js"></script>

    <!-- Demo Js -->
    <script src="../js/demo.js"></script>
</body>
</html>
	