<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="u" uri="/WEB-INF/utils.tld"%>

<t:list>
    <jsp:attribute name="title">Huntgroups</jsp:attribute>
    <jsp:attribute name="buttons">
    	<a class="btn btn-default" href="create"><i class="fa fa-plus"></i></a>
    </jsp:attribute>
    <jsp:body>
    	<table class="table table-bordered">
 			<tbody>
  				<tr>
  					<th>Name</th>
  					<th width="40"></th>
				</tr>
				<c:choose>
					<c:when test="${huntgroups == null || huntgroups.size() == 0}">
						<tr>
							<td colspan="2">No hungroups created</td>
						</tr>
					</c:when>
					<c:when test="${huntgroups.size() > 0}">
			        	<c:forEach items="${huntgroups}" var="h">
					    <tr>      
					        <td><a href="<c:url value="/feature/huntgroup/edit?id=${h.id}"/>">${h.name}</a></td>
					        <td><a onclick="return confirm('Are you sure?');" href="<c:url value="/feature/huntgroup/delete?id=${h.id}"/>"><i class="fa fa-trash">&nbsp;</i></a></td>
					    </tr>
						</c:forEach>
						<tr>
							<td colspan="2"><u:paginate clazz="pagination pagination-sm no-margin pull-right" total="${total}" size="${max}" page="${page}"/></td>
						</tr>
					</c:when>
				</c:choose>
 			</tbody>
 		</table>
    </jsp:body>
</t:list>