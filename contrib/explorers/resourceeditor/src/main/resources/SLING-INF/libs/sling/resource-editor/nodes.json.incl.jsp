
[
	<c:forEach var="theResource" items="<%=resource.listChildren()%>" varStatus="status">
		<c:set var="resourceIsNode" scope="request" value="<%=resource.adaptTo(Node.class) !=null %>"/>
		<%--Hiding the resource provider root. --%>
		<c:if test="${theResource.path != '/reseditor'}">
			<% Resource theResource = (Resource) pageContext.getAttribute("theResource");
			   Node node = theResource.adaptTo(Node.class);
			   String nodeType = (node !=null) ? node.getPrimaryNodeType().getName() : "";
			   pageContext.setAttribute("nodeType", nodeType);
			%>
			{
		        "text": "<i class=\"jstree-icon node-icon open-icon\"></i><i class=\"jstree-icon node-icon remove-icon\"></i><i class=\"jstree-icon node-icon add-icon\"></i>${fn:escapeXml(theResource.name)} [<span class=\"node-type\">${theResource.resourceType}</span>]",
				"li_attr": { "nodename" : "${fn:escapeXml(theResource.name)}", "nodetype" :"${nodeType}" },
				"a_attr": { "href" : "/reseditor${fn:escapeXml(theResource.path)}.html" },
		        "children" : <%= theResource.listChildren().hasNext() %> <%--${theResource.listChildren().hasNext()} will work in Servlet 3.0 --%>
			}${!status.last ? ',': ''}
		</c:if>
	</c:forEach>
]
