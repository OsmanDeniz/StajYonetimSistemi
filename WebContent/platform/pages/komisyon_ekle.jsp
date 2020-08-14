
<% if (session.getAttribute("username")==null) response.sendRedirect("../../index.jsp"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="top_section.jsp"></jsp:include>

 <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>Komisyon Ekle</h2>
            </div>
            <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="body">
                            <div class="row clearfix">
          					  <form  action="${pageContext.request.contextPath}/controll" method="post">

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="form-control" name="komisyon_adi" placeholder="Komisyon adı"/>
                                        </div>
                                     </div>
                                 </div>
                                 <div class="col-sm-1">
                                    <div class="form-group">
                                        <div class="form-line">
                                         <button class="btn btn-primary waves-effect" name="action" value="komisyon_ekle">Kaydet</button>      
                                        </div>       
                                    </div>
                                 </div> 
                            </form>   
                         </div>  </div></div></div></div>
                      </div>
				</section>
<jsp:include page="bottom_section.jsp"></jsp:include>