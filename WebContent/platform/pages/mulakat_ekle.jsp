
<% if (session.getAttribute("username")==null) response.sendRedirect("../../index.jsp"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<script type="text/javascript">
	function maxValue() {
		var userbox = document.getElementById('staj');
		var userinput = userbox.options[userbox.selectedIndex].value;
		if (userinput == "1") {
			document.getElementById("yapilanGun").max = "25";
		} else {
			document.getElementById("yapilanGun").max = "40";
		}
	}

	function argemi() {
		var userbox = document.getElementById('stajkonusu');
		var userinput = userbox.options[userbox.selectedIndex].value;
		if (userinput == "arge" || userinput == "Arge") {
			document.getElementById("yapilanGun").max = "60";
		}
	}

	var d_var, cvc_var, ivy_var, akd_var, arkd_var, p_var, dzn_var, s_var, i_var, m_var;
	function change_visible() {
		document.getElementById("devam").style.visibility = "visible";
	}
	function devam_yuzde4() {
		document.getElementById("cabavecalisma").style.visibility = "visible";
		var _yapilanGun = document.getElementById("yapilanGun").value;
		var x = document.getElementById("devam").value;
		var percent = x * 0.8;
		d_var = document.getElementById("kabuledilengun").value = _yapilanGun
				* percent / 100;
	}
	function cabavecalisma_yuzde4() {
		document.getElementById("isivaktindeyapma").style.visibility = "visible";
		var _yapilanGun = document.getElementById("yapilanGun").value;
		var x = document.getElementById("cabavecalisma").value;
		var percent = x * 0.8;
		cvc_var = document.getElementById("kabuledilengun").value = d_var
				+ (_yapilanGun * percent / 100);
	}
	function isivaktindeyapma_yuzde4() {
		document.getElementById("amirekarsidavranis").style.visibility = "visible";
		var _yapilanGun = document.getElementById("yapilanGun").value;
		var x = document.getElementById("isivaktindeyapma").value;
		var percent = x * 0.8;
		ivy_var = document.getElementById("kabuledilengun").value = cvc_var
				+ (_yapilanGun * percent / 100);
	}

	function amirekarsidavranis_yuzde4() {
		document.getElementById("arkadaslarinakarsidavranis").style.visibility = "visible";
		var _yapilanGun = document.getElementById("yapilanGun").value;
		var x = document.getElementById("amirekarsidavranis").value;
		var percent = x * 0.8;
		akd_var = document.getElementById("kabuledilengun").value = ivy_var
				+ (_yapilanGun * percent / 100);
	}
	function arkadaslarinakarsidavranis_yuzde4() {
		document.getElementById("proje").style.visibility = "visible";
		var _yapilanGun = document.getElementById("yapilanGun").value;
		var x = document.getElementById("arkadaslarinakarsidavranis").value;
		var percent = x * 0.8;
		arkd_var = document.getElementById("kabuledilengun").value = akd_var
				+ (_yapilanGun * percent / 100);
	}
	function proje_yuzde15() {
		document.getElementById("duzen").style.visibility = "visible";
		var _yapilanGun = document.getElementById("yapilanGun").value;
		var x = document.getElementById("proje").value;
		var percent = x * 0.15;
		p_var = document.getElementById("kabuledilengun").value = arkd_var
				+ (_yapilanGun * percent / 100);
	}
	function duzen_yuzde5() {
		document.getElementById("sunum").style.visibility = "visible";
		var _yapilanGun = document.getElementById("yapilanGun").value;
		var x = document.getElementById("duzen").value;
		var percent = x * 0.05;
		dzn_var = document.getElementById("kabuledilengun").value = p_var
				+ (_yapilanGun * percent / 100);
	}
	function sunum_yuzde5() {
		document.getElementById("icerik").style.visibility = "visible";
		var _yapilanGun = document.getElementById("yapilanGun").value;
		var x = document.getElementById("sunum").value;
		var percent = x * 0.05;
		s_var = document.getElementById("kabuledilengun").value = dzn_var
				+ (_yapilanGun * percent / 100);
	}
	function icerik_yuzde15() {
		document.getElementById("mulakat").style.visibility = "visible";
		var _yapilanGun = document.getElementById("yapilanGun").value;
		var x = document.getElementById("icerik").value;
		var percent = x * 0.15;
		i_var = document.getElementById("kabuledilengun").value = s_var
				+ (_yapilanGun * percent / 100);
	}
	function mulakat_yuzde40() {
		var _yapilanGun = document.getElementById("yapilanGun").value;
		var x = document.getElementById("mulakat").value;
		var percent = x * 0.4;
		m_var = document.getElementById("kabuledilengun").value = i_var
				+ (_yapilanGun * percent / 100);
	}
</script>


<jsp:include page="top_section.jsp"></jsp:include>
<section class="content">
	<div class="container-fluid">
		<div class="block-header">
			<h2>Mülakat Ekle</h2>
		</div>
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="body">
						<div class="row clearfix">
							<form action="${pageContext.request.contextPath}/controll" method="post" name="action">
								<div class="col-sm-12">
									<div class="form-group">
										<div class="form-line">
											<input type="text" class="form-control" align="right"
												name="mulakatiyapanuye"
												value="<%=session.getAttribute("nameSurname")%>" readonly/>
										</div>
									</div>
								</div>


								<div class="col-sm-12">
									<div class="form-group">
										<select class="form-control show-tick" name="ogrNo"
											id="ogrencino" required>
											<option value="">-- Öğrenci Numarası Seçiniz --</option>
											<%  try{
												  LocalDate localDate = LocalDate.now();
											        String bugun=DateTimeFormatter.ofPattern("dd.MM.yyyy").format(localDate).toString();
												
					                                        Class.forName("com.mysql.jdbc.Driver");
					                                		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
					                                		Statement st = con.createStatement();
					                                		String query = "SELECT ogrenciNo,Ad,Soyad,Ogretim,M_Tarihi,M_Saati,ToplamGun FROM randevu r,ogrenci o where r.ogrenciNo=o.Number  and M_Tarihi='"+bugun+"' and r.StajDegerlendirildi=0";
					                                		ResultSet rs=st.executeQuery(query);
					                                		while(rs.next()){
					                                		String numara= rs.getString("ogrenciNo");
					                                		String ad= rs.getString("Ad");
					                                		String soyad= rs.getString("Soyad");
					                                		String ogretim= rs.getString("Ogretim");
					                                		String tpGun=rs.getString("ToplamGun");
			                                		%>
											<option value="<%=numara%>"><%=numara+" "+ad+" "+soyad+"  ->"+ogretim+".Öğretim"+" --->Kabul Edilmiş ToplamGün: "+tpGun%></option>
											<%
				                                		}
				                                        }catch(Exception e){
				                                        	out.print(e.toString());
				                                        }
			                                        %>
										</select>
									</div>
								</div>

								<div class="col-sm-12">
									<div class="form-group">
										<select class="form-control show-tick" name="kacincistaj"
											id="staj" onchange="return maxValue();" required>
											<option value="">-- Staj Seçiniz --</option>
											<option value="1">1.Staj</option>
											<option value="2">2.Staj</option>
											<option value="3">3.Staj</option>
										</select>
									</div>
								</div>

								<div class="col-sm-12">
									<div class="form-group">
										<select class="form-control show-tick" name="kurumAdi"
											required>
											<option value="">-- Kurum Adı Seçiniz --</option>
											<%  try{
					                                        Class.forName("com.mysql.jdbc.Driver");
					                                		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
					                                		Statement st = con.createStatement();
					                                		String query = "select KurumAdi,CalismaAlani,Sehir from kurumlar";
					                                		ResultSet rs=st.executeQuery(query);
					                                		while(rs.next()){
					                                		String kurumadi= rs.getString("KurumAdi");
					                                		String calismaalani= rs.getString("CalismaAlani");
					                                		String sehir= rs.getString("Sehir");
			                                		%>
											<option value="<%=kurumadi%>"><%=kurumadi+" --->"+sehir%></option>
											<%
				                                		}
				                                        }catch(Exception e){
				                                        	out.print(e.toString());
				                                        }
			                                        %>
										</select>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<select class="form-control show-tick" name="stajKonusu"
											id="stajkonusu" onchange="return argemi();" required>
											<option value="">-- Staj Konusu Seçiniz --</option>
											<%  try{
					                                        Class.forName("com.mysql.jdbc.Driver");
					                                		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
					                                		Statement st = con.createStatement();
					                                		String query = "select Konu from stajkonusu";
					                                		ResultSet rs=st.executeQuery(query);
					                                		while(rs.next()){
					                                		String konu= rs.getString("Konu");
			                                		%>
											<option value="<%=konu%>"><%=konu%></option>
											<%
				                                		}
				                                        }catch(Exception e){
				                                        	out.print(e.toString());
				                                        }
			                                        %>
										</select>
									</div>
								</div>
								<!--  -->
								<div class="col-sm-12">
									<div class="form-group">
										<div class="form-line">
											<input type="text" id="date" name="baslangicTarihi"
												class="datepicker form-control floating-label"
												placeholder="Başlangıç Tarihini Seçiniz..." required />
										</div>
									</div>
								</div>

								<div class="col-sm-12">
									<div class="form-group">
										<div class="form-line">
											<input type="text" id="date" name="bitisTarihi"
												class="datepicker form-control floating-label"
												placeholder="Bitiş Tarihini Seçiniz..." required />
										</div>
									</div>
								</div>

								<div class="col-sm-12">
									<div class="form-group">
										<select class="form-control show-tick" name="sinif" required>
											<option value="">-- Sınıf Seçiniz --</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control" id="yapilanGun"
												onchange="return change_visible();" name="stajyapilanGun"
												placeholder="Staj Yapılan Gün" min="15" max="60" required />
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control" name="devam"
												onchange="return devam_yuzde4();" id="devam"
												placeholder="Devam (0-5) %4" min="0" max="5" required
												style="visibility: hidden" />
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control"
												name="cabavecalisma" id="cabavecalisma"
												onchange="return cabavecalisma_yuzde4();"
												placeholder="Çaba ve Çalışma (0-5) %4" min="0" max="5"
												required style="visibility: hidden" />
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control"
												id="isivaktindeyapma" name="isivaktindeyapma"
												onchange="return isivaktindeyapma_yuzde4();"
												placeholder="İşi Vaktinde Yapma (0-5) %4" min="0" max="5"
												required style="visibility: hidden" />
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control"
												name="amirekarsidavranis" id="amirekarsidavranis"
												onchange="return amirekarsidavranis_yuzde4();"
												placeholder="Amire Karşı Davranış (0-5) %4" min="0" max="5"
												required style="visibility: hidden" />
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control"
												name="arkadaslarinakarsidavranis"
												id="arkadaslarinakarsidavranis"
												onchange="return arkadaslarinakarsidavranis_yuzde4();"
												placeholder="Arkadaşlarına Karşı Davranış (0-5) %4" min="0"
												max="5" required style="visibility: hidden" />
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control" name="proje"
												id="proje" onchange="return proje_yuzde15();"
												placeholder="Proje (0-100) %15" min="0" max="100" required
												style="visibility: hidden" />
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control" name="duzen"
												id="duzen" onchange="return duzen_yuzde5();"
												placeholder="Düzen (0-100) %5" min="0" max="100" required
												style="visibility: hidden" />
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control" name="sunum"
												id="sunum" onchange="return sunum_yuzde5();"
												placeholder="Sunum (0-100) %5" min="0" max="100" required
												style="visibility: hidden" />
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control" name="icerik"
												id="icerik" onchange="return icerik_yuzde15();"
												placeholder="İçerik (0-100) %15" min="0" max="100" required
												style="visibility: hidden" />
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control" name="mulakat"
												id="mulakat" onchange="return mulakat_yuzde40();"
												placeholder="Mülakat (0-100) %40" min="0" max="100" required
												style="visibility: hidden" />
										</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-line">
											<input type="number" class="form-control"
												name="kabuledilengun" id="kabuledilengun"
												placeholder="Kabul Edilen Gün" min="0" required readonly />
										</div>
									</div>
								</div>



								<div class="col-sm-1">
									<div class="form-group">
										<button class="btn btn-primary waves-effect" name="action"
											value="mulakat_ekle">Kaydet</button>
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
<%-- <jsp:include page="bottom_section.jsp"></jsp:include> --%>

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
<script
	src="../plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>

<!-- Custom Js -->
<script src="../js/admin.js"></script>
<script src="../js/pages/forms/basic-form-elements.js"></script>

<!-- Demo Js -->
<script src="../js/demo.js"></script>
</body>
</html>
