<%@ page import= "java.sql.*" %>
<%
	String action = request.getParameter("action");
	if(action.equals("signin")){
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sbs", "root", "1994");
		Statement st = con.createStatement();
		String query = "select * from users where (username='"+username+"' and password='"+password+"')";
		ResultSet rs=st.executeQuery(query);
		if(rs.next()){
			session.setMaxInactiveInterval(60*60);
			session.setAttribute("username", username);
			session.setAttribute("nameSurname", rs.getString("name_surname"));
			session.setAttribute("email", rs.getString("email"));
			session.setAttribute("password",rs.getString("password"));
			response.sendRedirect("../platform/pages/index.jsp");
		}else{
			response.sendRedirect("index.jsp");
		}
	}catch(Exception e){
		System.out.print("Catch'ten hataya dustu: "+e.toString());
		response.sendRedirect("error.jsp");
	}
}else{
 	out.print("Eslesme yok");
}

%>
