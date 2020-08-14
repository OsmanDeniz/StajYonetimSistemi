
<%@page import="java.util.concurrent.TimeUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.lang.Math"%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs?useSSL=false", "root", "1994");
		Statement st = con.createStatement();
		String action = request.getParameter("action");

		if (action.equals(null)) {
			response.sendRedirect("index.jsp");

			/* TAMAMLANMASI GEREKEN GuN */
		} else if (action.equals("tamamlanacakGunEkle")) {
			String gun = request.getParameter("gun");
			try {
				String sql = "update ayar set TamamlanmasiGerekenGun='" + Integer.valueOf(gun) + "' where id=1";
				st.executeUpdate(sql);
				response.sendRedirect("tamamlanacakGun.jsp");
			} catch (Exception e) {
				System.out.print(e.toString());
			}
			/* ogrenci EKLE */

		} else if (action.equals("ogrenciEkle")) {
			String numara = (request.getParameter("numara"));
			String ad = request.getParameter("ad");
			String soyad = request.getParameter("soyad");
			String ogretim = request.getParameter("ogretim");
			String gun = request.getParameter("gun");
			String sql = "insert into ogrenci(Number,Ad,Soyad,Ogretim,TamamlamasiGerekenGun) values ('" + numara
					+ "','" + ad + "','" + soyad + "','" + ogretim + "','" + gun + "')";
			System.out.print(sql);
			st.execute(sql);
			response.sendRedirect("ogrenci_ekle.jsp");

			/* STAJ KONUSU */
		} else if (action.equals("stajKonusuEkle")) {
			String stajKonusu = request.getParameter("stajKonusu");
			String sql = "insert into stajkonusu(Konu) values('" + stajKonusu + "')";
			st.execute(sql);
			response.sendRedirect("stajkonusu_ekle.jsp");

			/* KURUM */
		} else if (action.equals("kurumEkle")) {
			String kurumAdi = request.getParameter("kurumadi");
			String sehir = request.getParameter("sehir");
			String calismaAlani = request.getParameter("calismaAlani");
			String sql = "insert into kurumlar(KurumAdi,Sehir,CalismaAlani) values('" + kurumAdi + "','" + sehir
					+ "','" + calismaAlani + "')";
			st.execute(sql);
			response.sendRedirect("kurum_ekle.jsp");

			/* KOMÄ°SYON */
		} else if (action.equals("komisyon_ekle")) {
			String komisyon = request.getParameter("komisyon_adi");
			String sql = "insert into komisyon(KomisyonAdi) values('" + komisyon + "')";
			st.execute(sql);
			response.sendRedirect("komisyon_ekle.jsp");

			/* KOMÄ°SYON ÃYESÄ° */
		} else if (action.equals("komisyon_uye_ekle")) {
			String komisyon_adi = request.getParameter("komisyon_adi");
			String komisyon_uye = request.getParameter("komisyon_uye_adi");
			String sql = "insert into komisyonuyesi(KomisyonAdi,UyeAdi) values('" + komisyon_adi + "','"
					+ komisyon_uye + "')";
			st.execute(sql);
			response.sendRedirect("komisyon_uyesi_ekle.jsp");

			/* RANDEVU */
		} else if (action.equals("randevu_ekle")) {
			int numara = Integer.parseInt(request.getParameter("Number"));
			String tarih = request.getParameter("tarih");
			String saat = request.getParameter("saat");
			String komisyon = request.getParameter("komisyon");
			String sql = "insert into randevu(ogrenciNo,M_Tarihi,M_Saati,M_Komisyonu) values ('" + numara
					+ "','" + tarih + "','" + saat + "','" + komisyon + "')";
			st.executeUpdate(sql);
			response.sendRedirect("randevu_ekle.jsp");

		} else if (action.equals("kullanici_ekle")){
			String komisyon_uyesi= request.getParameter("komisyon_uyesi");
			String username= request.getParameter("username");
			String password= request.getParameter("password");
			String email= request.getParameter("email");
			String sql = "insert into users(username,password,name_surname,email) values ('"+username+"','"+password+"','"+komisyon_uyesi+"','"+email+"')";
			st.executeUpdate(sql);
			response.sendRedirect("kullanici_ekle.jsp");
		} else if(action.equals("userProfile")){
			String name= request.getParameter("nameSurname");
			String username= request.getParameter("username");
			String password= request.getParameter("password");
			String email= request.getParameter("email");
			String sql="update users set `password`='"+password+"',name_surname='"+name+"',email='"+email+"' WHERE username='"+username+"' ";
			st.executeUpdate(sql);
			response.sendRedirect("userProfile.jsp");
		} else if(action.equals("dgs_yatayGecis")){
			String numara = request.getParameter("ogrNo");
			String oncekiOkul = request.getParameter("oncekiOkul");
			String kurumAdi = request.getParameter("kurumAdi");
			String yapilanGun = request.getParameter("yapilanGun");
			String kabulEdilecekGun = request.getParameter("kabulEdilecekGun");
			String selectsql = "Select * from ogrenci where Number='"+numara+"' ";
			ResultSet rs = st.executeQuery(selectsql);
			String toplamgun=null;
			while(rs.next()){
        		toplamgun= rs.getString("ToplamGun");
        		out.print(toplamgun.toString());
			}
			int tgun= Integer.valueOf(toplamgun);
			String insertsql = "insert into dgs_yataygecis values ('"+numara+"','"+oncekiOkul+"','"+kurumAdi+"','"+yapilanGun+"','"+kabulEdilecekGun+"')";
			String updateSql = "Update ogrenci set Dgs_yatayGecis=1,ToplamGun='"+(Integer.valueOf(kabulEdilecekGun)+ tgun)+"' where Number='"+numara+"' ";
			st.executeUpdate(insertsql);
			st.executeUpdate(updateSql);
			response.sendRedirect("dgs_yatayGecis.jsp");
		} else if (action.equals("mulakat_ekle")){
			try{
				
				String ogrNo=request.getParameter("ogrNo");
				String kacincistaj=request.getParameter("kacincistaj");
				String stajyapilanGun=request.getParameter("stajyapilanGun");
				String kurumAdi= request.getParameter("kurumAdi");
				String baslangicTarihi= request.getParameter("baslangicTarihi");
				String bitisTarihi= request.getParameter("bitisTarihi");
				String stajKonusu= request.getParameter("stajKonusu");
				String sinif= request.getParameter("sinif");
				String devam= request.getParameter("devam");
				String cabavecalisma= request.getParameter("cabavecalisma");
				String isivaktindeyapma= request.getParameter("isivaktindeyapma");
				String amirekarsidavranis= request.getParameter("amirekarsidavranis");
				String arkadaslarinakarsidavranis= request.getParameter("arkadaslarinakarsidavranis");
				String proje= request.getParameter("proje");
				String duzen= request.getParameter("duzen");
				String sunum= request.getParameter("sunum");
				String icerik= request.getParameter("icerik");
				String mulakat= request.getParameter("mulakat");
				String kabuledilengun= String.valueOf( Integer.valueOf((int) Math.ceil(Double.parseDouble(request.getParameter("kabuledilengun")))));
				String mulakatiYapanUye= request.getParameter("mulakatiyapanuye");
				/* Gecerli tarih */
				LocalDate localDate = LocalDate.now();
				String mulakatTarihi=DateTimeFormatter.ofPattern("dd.MM.yyyy").format(localDate).toString();
				
				String toplamGunsql = "Select ToplamGun from ogrenci where Number='"+ogrNo+"'";
				ResultSet rs;
				rs = st.executeQuery(toplamGunsql);
				String toplamGun="";
				while(rs.next()) 
					toplamGun=rs.getString("ToplamGun");
		
				int guncelToplam = Integer.valueOf(kabuledilengun)+Integer.valueOf(toplamGun);
				
				String mingunSql = "Select TamamlanmasiGerekenGun from ayar";
				rs = st.executeQuery(mingunSql); 
				String mingun="";
				while (rs.next())
					mingun=rs.getString("TamamlanmasiGerekenGun");
				String ogrenciUpdateSql;
				if(guncelToplam>=Integer.valueOf(mingun)){
					 ogrenciUpdateSql = "Update ogrenci set ToplamGun='"+guncelToplam+"',StajiBittiMi=1 where Number='"+ogrNo+"' ";
				}else{
					 ogrenciUpdateSql= "Update ogrenci set ToplamGun='"+guncelToplam+"' where Number='"+ogrNo+"' ";
				}
				String randevuSql = "Update randevu set StajDegerlendirildi=1 where ogrenciNo='"+ogrNo+"'";
				String mulakatSql= "insert into mulakat(ogrNo,KacinciStaj,KurumAdi,BaslamaTarihi,BitisTarihi,StajKonusu,Sinifi,Devam,CabaVeCalisma,isiVaktindeYapma,AmireKarsiDavranis,ArkadaslarinaKarsiDavranis,Proje,Duzen,Sunum,icerik,Mulakat,YapilanGun,KabulEdilenGun,MulakatTarihi,MulakatiYapanUye) values ('"+ogrNo+"','"+kacincistaj+"','"+kurumAdi+"','"+baslangicTarihi+"','"+bitisTarihi+"','"+stajKonusu+"','"+sinif+"','"+devam+"','"+cabavecalisma+"','"+isivaktindeyapma+"','"+amirekarsidavranis+"','"+arkadaslarinakarsidavranis+"','"+proje+"','"+duzen+"','"+sunum+"','"+icerik+"','"+mulakat+"','"+stajyapilanGun+"','"+kabuledilengun+"','"+mulakatTarihi+"','"+mulakatiYapanUye+"')";
				
// 					System.out.println(mulakatSql);
					st.executeUpdate(mulakatSql);
					st.executeUpdate(ogrenciUpdateSql);
					st.executeUpdate(randevuSql);
				
					
					response.sendRedirect("mulakat_ekle.jsp");

// 				System.out.println(ogrenciUpdateSql);
// 				System.out.println(randevuSql);
// 				System.out.println(mulakatSql);
				
			}catch(Exception e){
				System.out.print("Ayıkla pirincin taşını hadi bakalım");
			}
		}

	} catch (Exception e) {
		System.out.print(e.toString());
		response.sendRedirect("index.jsp");
	}
%>