
<% if (session.getAttribute("username")==null) response.sendRedirect("../../index.jsp"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="top_section.jsp"></jsp:include>
<section class="content">
	<div class="block-header">
		<h2>Staj Konusu Ekle</h2>
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="card">
			<div class="body">
				<div class="row clearfix">
					<form action="${pageContext.request.contextPath}/controll" method="post">
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-line">
									<br> <br> <input type="text" class="form-control"
										name="stajKonusu" placeholder="Staj Konusunu Giriniz" />
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<button class="btn btn-primary waves-effect" name="action"
								value="stajKonusuEkle">Kaydet</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="bottom_section.jsp"></jsp:include>