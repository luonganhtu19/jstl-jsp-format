<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 1/1/2021
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>format-jstl</title>
  </head>
  <body>
  <h2>fmt: formatNumber example</h2>
  <c:set var="accountBalance" value="12345.6789"/>
  <h3>accountBalance=<c:out value="${accountBalance}"/></h3>

  The Account Balance can be displayed using various ways:
  <p>
    formatNumber (type='currency'):
    <strong>
     <fmt:formatNumber value="${accountBalance}" type="currency"/>
    </strong>
  </p>
  <p>
    formatNumber (type='number' , maxIntegerDigits='2' ):
    <strong>
      <fml:formatNumber type="number" maxIntegerDigits="2" value="${accountBalance}"/>
    </strong>
  </p>
  <p>
    formatNumber (type='number' , maxFractionDigits='2' ):
    <strong>
      <fmt:formatNumber type="number" maxFractionDigits="2" value="${accountBalance}" />
    </strong>
  </p>
  <p>
    formatNumber(type='number' , groupingUsed='false'):
    <strong>
    <fmt:formatNumber type="number" groupingUsed="false" value="${accountBalance}"/>
    </strong>
  </p>
  <p>
    formatNumber(type='percent' , maxIntegerDigits='3'):
    <strong>
      <fmt:formatNumber type="percent" maxIntegerDigits="3" value="${accountBalance}"/>
    </strong>
  </p>
  <p>
    formatNumber(type='percent' , maxFactionDigits='2'):
    <strong>
      <fmt:formatNumber type="percent" maxFractionDigits="2" value="${accountBalance}"/>
    </strong>
  </p>
  <p>
    formatNumber (type='number', pattern= '##.###E0'):
    <strong>
      <fmt:formatNumber type="number" pattern="##.###E0" value="${accountBalance}" />
    </strong>
  </p>
  <p>
    Account Balance in USA (fmt:setLocale value='en_US'):
    <br/>
    formatNumber(type='currency'):
    <fmt:setLocale value="en_US"/>
    <strong>
      <fmt:formatNumber value="${accountBalance}" type="currency"/>
    </strong>
  </p>
  <p>
    Account Balance in Canada (fmt:setLocale value='fr_CA'):
    <br/>
    formatNumber (type='currency'):
    <fmt:setLocale value="fr_CA"/>
    <strong>
      <fmt:formatNumber value="${accountBalance}" type="currency"/>
    </strong>
  </p>


  <h2>fmt: parseNumber example</h2>
  <!-- Một chuỗi định dạng tiền tệ -->
  <c:set var="accountBalance" value="$123450.6789"/>
  <h4>Input<c:out value="${accountBalance}"/></h4>

  <fmt:parseNumber var="parsedNumber" type="currency"
     parseLocale="en_US"
                   value="${accountBalance}"
  />
  <p> Account Balance: <c:out value="${parsedNumber}"/></p>

  <!-- integerOnly="true": Chỉ lấy phần nguyên -->

  <fmt:parseNumber var="parsedNumber" type="currency"
                    integerOnly="true" parseLocale="en_Us" value="${accountBalance}"/>
  <p>Account Balance (without cents): <c:out value="${parsedNumber}"/></p>

  <h2>fmt:formatDate example</h2>
  <c:set var="now" value="<%= new java.util.Date()%>"/>
  <p>
    Time (fmt: formatDate type="time"):
    <strong>
      <fmt:formatDate type="time" value="${now}"/>
    </strong>
  </p>
  <p>
    Date(fmt: formatDate type="date"):
    <strong>
      <fmt:formatDate type="date" value="${now}"/>
    </strong>
  </p>
  <p>
    Date, Time(fmt: formatDate type="both"):
    <strong>
      <fmt:formatDate type="both"  value="${now}"/>
    </strong>
  </p>
  <p>
    Date, time Short(fmt:formatDate type="both" dateStyle="short"):
    <strong>
      <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${now}"/>
    </strong>
  </p>
  <p>
    Date, time Medium(fmt:formatDate type="both" dateStyle="medium" timeStyle="medium"):
    <strong>
      <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${now}"/>
    </strong>
  </p>
  <p>
    Date, time Long(fmt:formatDate type="both" dateStyle="long" timeStyle="long"):
    <strong>
      <fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${now}"/>
    </strong>
  </p>
  <p>
    Date, time (dd-yyyy-MM HH:mm:ss):
    <strong>
      <fmt:formatDate pattern="dd-yyyy-MM HH:mm:ss" value="${now}"/>
    </strong>
  </p>

  <!-- Store in variable -->

  <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${now}" var="nowString" />
  <p>
    Now String (dd-MM-yyyy HH:mm):
    <strong>
      <c:out value="${nowString}"/>
    </strong>
  </p>


  <h2>fmt: parseDate example</h2>
  <!-- Một chuỗi có định dạng ngày tháng thời gian -->
  <c:set var="dateTimeString" value="13-11-2021 16:21"/>
  <h4>
    dateTimeString:
    <c:out value="${dateTimeString}"/>
  </h4>
  <!-- Phân tích chuỗi mô tả ngày tháng thời gian lưu vào kiểu biến java.util.date -->

  <fmt:parseDate value="${dateTimeString}" type="both" var="parseDateTime" pattern="dd-MM-yyyy HH:mm"/>
  <p>
    The date time after parsing:
    <c:out value="${parseDateTime}" />
  </p>
  <br/>
  <p>
    Date only(dd/MM/yyyy):
    <fmt:formatDate value="${parseDateTime}" pattern="dd/MM/yyyy"/>
  </p>
  </body>
</html>
