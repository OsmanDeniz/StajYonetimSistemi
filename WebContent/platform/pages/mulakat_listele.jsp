
<%
if (session.getAttribute("username") == null)
	response.sendRedirect("../../index.jsp");
 %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="top_section.jsp"></jsp:include>
<%@ page import="java.sql.*"%>


<section class="content">
	<!-- Exportable Table -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2>Öğrenciler</h2>
				</div>
				<form action="#" method="post">

					<div class="col-sm-5">
						<div class="form-group">
							<div class="form-line">
								<input type="text" id="date" name="tarih1"
									class="datepicker form-control floating-label"
									placeholder="Başlangıç Tarihini Seçiniz..." required />
							</div>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="form-group">
							<div class="form-line">
								<input type="text" id="date" name="tarih2"
									class="datepicker form-control floating-label"
									placeholder="Bitiş Tarihini Seçiniz..." required />
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<button class="btn btn-primary waves-effect">Listele</button>
						</div>
					</div>
				</form>

				<br> <br>

				<div class="body">
					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-hover dataTable js-exportable">
							<thead>
								<tr>
									<th>Numara</th>
									<th>Adı</th>
									<th>Soyadı</th>
									<th>Öğretim</th>
									<th>Sınıf</th>
									<th>Staj</th>
									<th>Kurum Adı</th>
									<th>Başlama Tarihi</th>
									<th>Bitiş Tarihi</th>
									<th>Yapılan Gün</th>
									<th>Kabul Edilen Gün</th>
									<th>Mülakat Yapılan Tarih</th>
									<th>Mülakatı Yapan Üye</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Numara</th>
									<th>Adı</th>
									<th>Soyadı</th>
									<th>Öğretim</th>
									<th>Sınıf</th>
									<th>Staj</th>
									<th>Kurum Adı</th>
									<th>Başlama Tarihi</th>
									<th>Bitiş Tarihi</th>
									<th>Yapılan Gün</th>
									<th>Kabul Edilen Gün</th>
									<th>Mülakat Yapılan Tarih</th>
									<th>Mülakatı Yapan Üye</th>
								</tr>
							</tfoot>
							<tbody>

								<%
									try {
										Class.forName("com.mysql.jdbc.Driver");
										Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
										Statement st = con.createStatement();
										String query = "Select Number,Ad,Soyad,Ogretim,Sinifi,KacinciStaj,KurumAdi,BaslamaTarihi,BitisTarihi,YapilanGun,KabulEdilenGun,MulakatTarihi,MulakatiYapanUye from ogrenci o,mulakat m where o.Number=m.ogrNo  and MulakatTarihi BETWEEN '"+request.getParameter("tarih1")+"' and '"+request.getParameter("tarih2")+"' ";
										ResultSet rs = st.executeQuery(query);
										String soyad;
										while (rs.next()) {
											System.out.print("Number");
											
											%>
								<tr>
									<td><%=rs.getString("Number")%></td>
									<td><%=rs.getString("Ad")%></td>
									<td><%=rs.getString("Soyad")%></td>
									<td><%=rs.getString("Ogretim")%></td>
									<td><%=rs.getString("Sinifi")%></td>
									<td><%=rs.getString("KacinciStaj")%></td>
									<td><%=rs.getString("KurumAdi")%></td>
									<td><%=rs.getString("BaslamaTarihi")%></td>
									<td><%=rs.getString("BitisTarihi")%></td>
									<td><%=rs.getString("YapilanGun")%></td>
									<td><%=rs.getString("KabulEdilenGun")%></td>
									<td><%=rs.getString("MulakatTarihi")%></td>
									<td><%=rs.getString("MulakatiYapanUye")%></td>
								</tr>
								<%
									}
									} catch (Exception ex) {
										ex.printStackTrace();
										out.println("error" + ex.getMessage());
									}
								%>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- #END# Exportable Table -->
</section>

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
<script
	src="../plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>

<!-- Demo Js -->
<script src="../js/demo.js"></script>

<!-- Jquery DataTable Plugin Js -->
<script src="../plugins/jquery-datatable/jquery.dataTables.js"></script>
<script
	src="../plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
<script
	src="../plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
<script
	src="../plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
<script src="../plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
<script
	src="../plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
<script src="../plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
<script
	src="../plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
<script
	src="../plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

<!-- Custom Js -->
<script src="../js/admin.js"></script>
<script src="../js/pages/tables/jquery-datatable.js"></script>
<script src="../js/pages/forms/basic-form-elements.js"></script>

</body>

</html>
