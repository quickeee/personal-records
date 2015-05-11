<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>
        <spring:message code="home.title" />
    </title>
    <spring:theme var="cssStyle" code="css.style"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="${cssStyle}" />"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/styles/general.css" />"/>
</head>
<body>
<div id="page">
    <div class="banner"></div>
    <div class="themeLocal">
        <c:choose>
            <c:when test="${requestContext.locale.language eq 'en'}">
                <c:url var="localeUrl" value="/">
                    <c:param name="locale" value="de"/>
                </c:url>
                <a href="${localeUrl}"><spring:message code="locale.de"/></a>
            </c:when>
            <c:otherwise>
                <c:url var="localeUrl" value="/">
                    <c:param name="locale" value="en"/>
                </c:url>
                <a href="${localeUrl}"><spring:message code="locale.en"/></a>
            </c:otherwise>
        </c:choose> |
        <c:choose>
            <c:when test="${requestContext.theme.name eq 'green'}">
                <c:url var="themeUrl" value="/">
                    <c:param name="theme" value="blue"/>
                </c:url>
                <a href="${themeUrl}"><spring:message code="theme.Blue"/></a>
            </c:when>
            <c:otherwise>
                <c:url var="themeUrl" value="/">
                    <c:param name="theme" value="green"/>
                </c:url>
                <a href="${themeUrl}"><spring:message code="theme.Green"/></a>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="menu">
        <ul>
            <li><c:if test="${menuTab eq 'home'}">
                <strong><a href="<c:url value="/"/>"><spring:message code="menu.home"/></a></strong>
            </c:if>
                <c:if test="${menuTab != 'home'}">
                    <a href="<c:url value="/"/>"><spring:message code="menu.home"/></a>
                </c:if>
            </li>
            <li><c:if test="${menuTab eq 'persons'}">
                <strong><a href="<c:url value="/persons/list"/>"><spring:message code="menu.persons"/></a></strong>
            </c:if>
                <c:if test="${menuTab != 'persons'}">
                    <a href="<c:url value="/persons/list"/>"><spring:message code="menu.persons"/></a>
                </c:if>
            </li>
        </ul>
    </div>
<div class="content">
    <h2>
        <spring:message code="persons.list.title"/>
    </h2>

    <div class="persons">
        <table>
            <thead>
            <tr>
                <td>
                    <spring:message code="label.Person.count"/>
                </td>
                <td>
                    <spring:message code="label.Person.firstname"/>
                </td>
                <td>
                    <spring:message code="label.Person.lastname"/>
                </td>
                <td>
                    <spring:message code="label.Person.dob"/>
                </td>
                <td>
                    <spring:message code="label.Person.gender"/>
                </td>
                <td>
                    <pring:message code="label.Hospital.name"/>
                </td>
            </tr>
            </thead>
            <c:forEach var="person" items="${persons}">
                <tr>
                    <td>
                        <spring:url var="showUrl" value="{id}">
                            <spring:param name="id" value="${person.id}"/>
                        </spring:url>
                        <a href="${showUrl}">${person.id}</a>
                    </td>
                    <td>
                            ${person.firstName}
                    </td>
                    <td>
                            ${person.lastName}
                    </td>
                    <td>
                        <fmt:formatDate value="${person.dateOfBirth}"/>
                    </td>
                    <td>
                            ${person.gender.initial}
                    </td>
                    <td>
                            ${person.hospital.name}
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div class="footer">
    <p><fmt:message key="footer.text"/></p>
</div>
</div>
</body>
</html>