<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 1/1/2021
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%="Hello"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${not empty param.language}" >
    <c:set var="language" value="${param.language}" scope="session"/>
</c:if>
<%int x = 5;%>
<%! int y=5; %>
<%! void m(){y++;} %>
<!--
Nếu người dùng đã sử dụng một ngôn ngữ cụ thể khi xem một trang,
biến 'language' được sét đặt có phạm vi 'session' giá trị của nó sẽ tồn tại
trong suốt quá trình làm việc của người dùng, và website sẽ vẫn hiển thị theo ngôn ngữ đó,
nếu trên tham số của trang không chỉ định một ngôn ngữ cụ thể khác.
-->
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="org.o7planning.bundles.MyBundl"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>fmt:bundle example</title>
</head>
<body>
    <h2>fmt:bundle example</h2>
    <form action="">
    <table>
        <tr>
            <td>
                <fmt:message key="login.label.userName"/>
            </td>
            <td>
                <input type="text" name="userName"/>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:message key="login.label.password"/>
            </td>
            <td><input type="text" name="userName" /></td>
        </tr>
    </table>
    </form>
</body>
</html>
