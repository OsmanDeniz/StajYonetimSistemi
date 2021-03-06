
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
					<h2>Mülakata Alınacak Öğrenciler</h2>
				</div>

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
									<th>Mülakat Tarihi</th>
									<th>Mülakat Saati</th>
									<th>Mülakat Komisyonu</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
								<th>Numara</th>
									<th>Adı</th>
									<th>Soyadı</th>
									<th>Öğretim</th>
									<th>Mülakat Tarihi</th>
									<th>Mülakat Saati</th>
									<th>Mülakat Komisyonu</th>
								</tr>
							</tfoot>
							<tbody>
								<%
									try {
										Class.forName("com.mysql.jdbc.Driver");
										Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
										Statement st = con.createStatement();
										String query = "Select Number,Ad,Soyad,Ogretim,M_Tarihi,M_Saati,M_Komisyonu from randevu r, ogrenci o where r.ogrenciNo=o.Number  and r.StajDegerlendirildi=0";
										ResultSet rs = st.executeQuery(query);
										String soyad;
										while (rs.next()) {
								%>
								<tr>
									<td><%=rs.getString("Number")%></td>
									<td><%=rs.getString("Ad")%></td>
									<td><%=rs.getString("Soyad")%></td>
									<td><%=rs.getString("Ogretim")%></td>
									<td><%=rs.getString("M_Tarihi")%></td>
									<td><%=rs.getString("M_Saati")%></td>
									<td><%=rs.getString("M_Komisyonu")%></td>
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

</body>

</html>
