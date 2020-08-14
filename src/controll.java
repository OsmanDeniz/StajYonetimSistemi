import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.lang.Math;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/controll")
public class controll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Statement st;
	Connection con;

	public controll() {
		setConnection();
	}

	private void setConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs", "root", "1994");
			st = con.createStatement();
		} catch (Exception e) {

		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
/* Tamamlanacak Gun Ekle */
		if (action.equals("tamamlanacakGunEkle")) {
			try {
				String gun = request.getParameter("gun");
				String sql = "update ayar set TamamlanmasiGerekenGun='" + Integer.valueOf(gun) + "' where id=1";
				st.executeUpdate(sql);
				response.sendRedirect("platform/pages/tamamlanacakGun.jsp");
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
/* Ogrenci Ekle */
		} else if (action.equals("ogrenciEkle")) {
			try {
				String numara = request.getParameter("numara");
				String ad = request.getParameter("ad");
				String soyad = request.getParameter("soyad");
				String ogretim = request.getParameter("ogretim");
				String gun = request.getParameter("gun");
				String sql = "insert into ogrenci(Number,Ad,Soyad,Ogretim,TamamlamasiGerekenGun) values ('" + numara
						+ "','" + ad + "','" + soyad + "','" + ogretim + "','" + gun + "')";
				st.execute(sql);
				response.sendRedirect("platform/pages/ogrenci_ekle.jsp");
			} catch (SQLException e) {
				if (e instanceof SQLIntegrityConstraintViolationException) {
					// Duplicate entry
					response.sendRedirect("platform/pages/index.jsp");
				}
			}
/* Staj Konusu Ekle */
		} else if (action.equals("stajKonusuEkle")) {
			try {
				String stajKonusu = request.getParameter("stajKonusu");
				String sql = "insert into stajkonusu(Konu) values('" + stajKonusu + "')";
				st.execute(sql);
				response.sendRedirect("platform/pages/stajkonusu_ekle.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
/* Kurum Ekle */
		} else if (action.equals("kurumEkle")) {
			try {
				String kurumAdi = request.getParameter("kurumadi");

				String sehir = request.getParameter("sehir");
				String calismaAlani = request.getParameter("calismaAlani");
				String sql = "insert into kurumlar(KurumAdi,Sehir,CalismaAlani) values('" + kurumAdi + "','" + sehir
						+ "','" + calismaAlani + "')";
				st.execute(sql);
				response.sendRedirect("platform/pages/kurum_ekle.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
/* Komisyon Ekle */
		} else if (action.equals("komisyon_ekle")) {

			try {
				String komisyon = request.getParameter("komisyon_adi");
				String sql = "insert into komisyon(KomisyonAdi) values('" + komisyon + "')";
				st.execute(sql);

				response.sendRedirect("platform/pages/komisyon_ekle.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
/* Komisyon Uyesi Ekle */
		} else if (action.equals("komisyon_uye_ekle")) {
			try {
				String komisyon_adi = request.getParameter("komisyon_adi");
				String komisyon_uye = request.getParameter("komisyon_uye_adi");
				String sql = "insert into komisyonuyesi(KomisyonAdi,UyeAdi) values('" + komisyon_adi + "','"
						+ komisyon_uye + "')";
				st.execute(sql);
				response.sendRedirect("platform/pages/komisyon_uyesi_ekle.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
/* Randevu Ekle */
		} else if (action.equals("randevu_ekle")) {
			try {
				int numara = Integer.parseInt(request.getParameter("Number"));
				String tarih = request.getParameter("tarih");
				String saat = request.getParameter("saat");
				String komisyon = request.getParameter("komisyon");
				String sql = "insert into randevu(ogrenciNo,M_Tarihi,M_Saati,M_Komisyonu) values ('" + numara + "','"
						+ tarih + "','" + saat + "','" + komisyon + "')";
				st.execute(sql);
				response.sendRedirect("platform/pages/randevu_ekle.jsp");
			} catch (SQLException e) {
				response.sendRedirect("../login/error.jsp");
			}
/* Komisyon Guncelle-Emre */
		} else if (action.equals("komisyonGuncelle")) {
			try {
				String eskiKomisyon = request.getParameter("eskiKomisyon");
				String yeniKomisyon = request.getParameter("yeniKomisyon");
				System.out.print(eskiKomisyon);
				System.out.print(yeniKomisyon);
				String sql = "update komisyon set KomisyonAdi='" + yeniKomisyon + "' where KomisyonAdi='" + eskiKomisyon
						+ "'";
				st.executeUpdate(sql);
				response.sendRedirect("platform/pages/komisyon_guncelle.jsp");
			} catch (Exception e) {
				System.out.print(e.toString());
			}
/* OgrenciGuncelle */
		} else if (action.equals("ogrenciGuncelle")) {

			try {
				String numara = request.getParameter("numara");
				String ad = request.getParameter("ad");
				String soyad = request.getParameter("soyad");
				String ogretim = request.getParameter("ogretim");
				String sql = "Update ogrenci set  Ad='" + ad + "', Soyad='" + soyad + "', Ogretim='" + ogretim
						+ "' where Number='" + numara + "'   ";
				st.executeUpdate(sql);
				response.sendRedirect("platform/pages/ogrenci_ekle.jsp");
			} catch (Exception e) {
				System.out.print(e.toString());
			}
/* RandevuGuncelle */
		} else if (action.equals("randevuGuncelle")) {
			try {
				int numara = Integer.parseInt(request.getParameter("numara"));
				String tarih = request.getParameter("tarih");
				String saat = request.getParameter("saat");
				String komisyon = request.getParameter("komisyon");
				String sql = "update randevu set M_Tarihi='" + tarih + "',M_Saati='" + saat + "',M_Komisyonu='"
						+ komisyon + "' where ogrenciNo='" + numara + "'";
				st.executeUpdate(sql);
				response.sendRedirect("platform/pages/randevu_ekle.jsp");
			} catch (Exception e) {

			}
/* KomisyonSil-Emre */
		} else if (action.equals("komisyonSil")) {
		
				try {
					String uye = request.getParameter("komisyonUyesi");
					System.out.print(uye);
					String sql = " delete from komisyonuyesi where UyeAdi='" + uye + "'";
					st.execute(sql);
					response.sendRedirect("platform/pages/komisyon_uyesi_sil.jsp");
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
/*KullanýcýEkle*/
		else if (action.equals("kullanici_ekle")) {
			try {
				String komisyon_uyesi = request.getParameter("komisyon_uyesi");
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String email = request.getParameter("email");
				String sql = "insert into users(username,password,name_surname,email) values ('" + username + "','"
						+ password + "','" + komisyon_uyesi + "','" + email + "')";
				st.executeUpdate(sql);
				response.sendRedirect("platform/pages/kullanici_ekle.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
/*Profil*/
		} else if (action.equals("userProfile")) {
			try {
				String name = request.getParameter("nameSurname");
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String email = request.getParameter("email");
				String sql = "update users set `password`='" + password + "',name_surname='" + name + "',email='"
						+ email + "' WHERE username='" + username + "' ";
				st.executeUpdate(sql);
				response.sendRedirect("platform/pages/userProfile.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
/*Dgs_YatayGecis*/		
		} else if (action.equals("dgs_yatayGecis")) {
			try {
				String numara = request.getParameter("ogrNo");
				String oncekiOkul = request.getParameter("oncekiOkul");
				String kurumAdi = request.getParameter("kurumAdi");
				String yapilanGun = request.getParameter("yapilanGun");
				String kabulEdilecekGun = request.getParameter("kabulEdilecekGun");
				String selectsql = "Select * from ogrenci where Number='" + numara + "' ";
				ResultSet rs = st.executeQuery(selectsql);
				String toplamgun = null;
				while (rs.next()) {
					toplamgun = rs.getString("ToplamGun");
					out.print(toplamgun.toString());
				}
				int tgun = Integer.valueOf(toplamgun);
				String insertsql = "insert into dgs_yataygecis values ('" + numara + "','" + oncekiOkul + "','"
						+ kurumAdi + "','" + yapilanGun + "','" + kabulEdilecekGun + "')";
				String updateSql = "Update ogrenci set Dgs_yatayGecis=1,ToplamGun='"
						+ (Integer.valueOf(kabulEdilecekGun) + tgun) + "' where Number='" + numara + "' ";
				st.executeUpdate(insertsql);
				st.executeUpdate(updateSql);
				response.sendRedirect("platform/pages/dgs_yatayGecis.jsp");
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
/*Mulakat*/
		} else if (action.equals("mulakat_ekle")) {
			try {
				String ogrNo = request.getParameter("ogrNo");
				String kacincistaj = request.getParameter("kacincistaj");
				String stajyapilanGun = request.getParameter("stajyapilanGun");
				String kurumAdi = request.getParameter("kurumAdi");
				String baslangicTarihi = request.getParameter("baslangicTarihi");
				String bitisTarihi = request.getParameter("bitisTarihi");
				String stajKonusu = request.getParameter("stajKonusu");
				String sinif = request.getParameter("sinif");
				String devam = request.getParameter("devam");
				String cabavecalisma = request.getParameter("cabavecalisma");
				String isivaktindeyapma = request.getParameter("isivaktindeyapma");
				String amirekarsidavranis = request.getParameter("amirekarsidavranis");
				String arkadaslarinakarsidavranis = request.getParameter("arkadaslarinakarsidavranis");
				String proje = request.getParameter("proje");
				String duzen = request.getParameter("duzen");
				String sunum = request.getParameter("sunum");
				String icerik = request.getParameter("icerik");
				String mulakat = request.getParameter("mulakat");
				String kabuledilengun = String.valueOf(
						Integer.valueOf((int) Math.ceil(Double.parseDouble(request.getParameter("kabuledilengun")))));
				String mulakatiYapanUye = request.getParameter("mulakatiyapanuye");
				/* Gecerli tarih */
				LocalDate localDate = LocalDate.now();
				String mulakatTarihi = DateTimeFormatter.ofPattern("dd.MM.yyyy").format(localDate).toString();
				String toplamGunsql = "Select ToplamGun from ogrenci where Number='" + ogrNo + "'";
				ResultSet rs;
				rs = st.executeQuery(toplamGunsql);
				String toplamGun = "";
				while (rs.next())
					toplamGun = rs.getString("ToplamGun");
				int guncelToplam = Integer.valueOf(kabuledilengun) + Integer.valueOf(toplamGun);

				String mingunSql = "Select TamamlanmasiGerekenGun from ayar";
				rs = st.executeQuery(mingunSql);
				String mingun = "";
				while (rs.next())
					mingun = rs.getString("TamamlanmasiGerekenGun");
				String ogrenciUpdateSql;
				if (guncelToplam >= Integer.valueOf(mingun)) {
					ogrenciUpdateSql = "Update ogrenci set ToplamGun='" + guncelToplam
							+ "',StajiBittiMi=1 where Number='" + ogrNo + "' ";
				} else {
					ogrenciUpdateSql = "Update ogrenci set ToplamGun='" + guncelToplam + "' where Number='" + ogrNo
							+ "' ";
				}
				String randevuSql = "Update randevu set StajDegerlendirildi=1 where ogrenciNo='" + ogrNo + "'";
				String mulakatSql = "insert into mulakat(ogrNo,KacinciStaj,KurumAdi,BaslamaTarihi,BitisTarihi,StajKonusu,Sinifi,Devam,CabaVeCalisma,isiVaktindeYapma,AmireKarsiDavranis,ArkadaslarinaKarsiDavranis,Proje,Duzen,Sunum,icerik,Mulakat,YapilanGun,KabulEdilenGun,MulakatTarihi,MulakatiYapanUye) values ('"
						+ ogrNo + "','" + kacincistaj + "','" + kurumAdi + "','" + baslangicTarihi + "','" + bitisTarihi
						+ "','" + stajKonusu + "','" + sinif + "','" + devam + "','" + cabavecalisma + "','"
						+ isivaktindeyapma + "','" + amirekarsidavranis + "','" + arkadaslarinakarsidavranis + "','"
						+ proje + "','" + duzen + "','" + sunum + "','" + icerik + "','" + mulakat + "','"
						+ stajyapilanGun + "','" + kabuledilengun + "','" + mulakatTarihi + "','" + mulakatiYapanUye
						+ "')";
				
				System.out.println(mulakatSql);
				System.out.println(ogrenciUpdateSql);
				System.out.println(randevuSql);
				st.executeUpdate(mulakatSql);
				System.out.println("11111111");
				st.executeUpdate(ogrenciUpdateSql);
				System.out.println("22222222");
				st.executeUpdate(randevuSql);
				System.out.println("33333333");
				response.sendRedirect("platform/pages/mulakat_ekle.jsp");
			} catch (Exception e) {
				System.out.println(e.toString());
				System.out.print("Ayýkla pirincin taþýný hadi bakalým");
			}
		}

		/* Beklenmedik bir hata durumu */
		else {
			response.sendRedirect("platform/pages/index.jsp");
		}
	}
}
