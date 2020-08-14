<% 
if (session.getAttribute("username") == null)
    response.sendRedirect("../../index.jsp"); 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<jsp:include page="top_section.jsp"></jsp:include> 
	<section class="content">
		<div class="block-header">
	    	<h2>Randevu  Güncelle</h2>
		</div>
		<div class="row clearfix">
	    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	        	<div class="card">
	            	<div class="body">
	                	<div class="row clearfix">
							<form action="randevu_guncelle.jsp" method="post" name="action" >
							<br><br>
								<div class="col-sm-12">
									<div class="form-group">
										<select class="form-control show-tick" name= "Number" onchange="this.form.submit();">
                                        <option value="">-- Öğrenci Numarası Seçiniz --</option>
                                       <%  try{
                                        Class.forName("com.mysql.jdbc.Driver");
                                		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?autoReconnect=true&useSSL=false", "root", "1994");
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
	                            </div></form>
	                            <%
										try {

											Class.forName("com.mysql.jdbc.Driver");
											Connection con = DriverManager.getConnection(
													"jdbc:mysql://localhost:3306/sbs?autoReconnect=true&useSSL=false", "root", "1994");
											Statement st = con.createStatement();
											String num = request.getParameter("Number");
											String query = "select * from randevu where ogrenciNo='" + num + "' ";
											ResultSet rs = st.executeQuery(query);
											
											while (rs.next()) {
									%>			
									<form action="${pageContext.request.contextPath}/controll" method="post">
									<div class="form-group">
										<div class="form-line">
											<input name="numara" type="text" class="form-control" value="<%=rs.getString("ogrenciNo")%>" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-line">
											<input name="tarih" type="text" class="form-control" value="<%=rs.getString("M_Tarihi")%>" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-line">
											<input name="saat" type="text" class="form-control" value="<%=rs.getString("M_Saati")%>" />
										</div>
									</div>
	                            	<select class="form-control show-tick" name= "komisyon" >
                                        <option value="<%=rs.getString("M_Komisyonu")%>"><%=rs.getString("M_Komisyonu")%></option>
                                        <%  try{
                                        Class.forName("com.mysql.jdbc.Driver");
                                		Connection cont = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?autoReconnect=true&useSSL=false", "root", "1994");
                                		Statement stt = cont.createStatement();
                                		String queryt = "select KomisyonAdi from komisyon";
                                		ResultSet rst=stt.executeQuery(queryt);
                                		while(rst.next()){
                                		String komisyonAdi= rst.getString("KomisyonAdi");                                		
                                		%>
                                        <option value="<%=komisyonAdi%>"><%=komisyonAdi%></option>
                             			 <%
                                		}
                                        }catch(Exception e){
                                        	out.print(e.toString());
                                        }%>
                                        </select>	
                                        </select>
                                        <div class="col-sm-1">
                                    <div class="form-group">
                                        <div class="form-line">
                                         <button class="btn btn-primary waves-effect" name="action" value="randevuGuncelle">Güncelle</button>      
                                        </div>       
                                    </div>
                                 </div> 
                                <%
                                }
							}
	                            catch(Exception e){
	                            	
	                            }
                                %>
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
	