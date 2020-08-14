
<%
	if (session.getAttribute("username") == null)
		response.sendRedirect("../../index.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="top_section.jsp"></jsp:include>
<section class="content">
	<div class="container-fluid">
		<div class="block-header">
			<h2>Kullanıcı Profili</h2>
		</div>
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="body">
						<div class="row clearfix">
							<form action="${pageContext.request.contextPath}/controll" method="post">
								<div class="col-sm-10">
									
									<div class="form-group">
										<div class="form-line">
											<h6>Ad Soyad:</h6>
											<input type="text" class="form-control" name="nameSurname"
												value="<%=session.getAttribute("nameSurname")%>" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-line">
											<h6>Kullanıcı Adı:</h6>
											<input type="text" class="form-control" name="username"
												value="<%=session.getAttribute("username")%>" readonly/>
										</div>
									</div>
									<div class="form-group">
										<div class="form-line">
											<h6>Şifre:</h6>
											<input type="password" class="form-control" name="password"
												value="<%=session.getAttribute("password")%>" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-line">
											<h6>Mail Adresi:</h6>
											<input type="text" class="form-control" name="email"
												value="<%=session.getAttribute("email")%>" />
										</div>
									</div>
								
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<button class="btn btn-primary waves-effect" name="action"
											value="userProfile">Güncelle</button>
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
<jsp:include page="bottom_section.jsp"></jsp:include>