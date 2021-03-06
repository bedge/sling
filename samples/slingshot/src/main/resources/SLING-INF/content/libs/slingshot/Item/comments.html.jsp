<%--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at
    
    http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
--%><%@page session="false" %><%
%><%@page import="org.apache.sling.api.resource.Resource,
                org.apache.sling.api.resource.ResourceUtil,
                org.apache.sling.api.resource.ValueMap,
                org.apache.sling.sample.slingshot.SlingshotConstants,
                org.apache.sling.api.request.ResponseUtil" %><%
%><%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects/><%
%><div class="ui-slingshot-comments">
<h3>Comments</h3>
<%
    final Resource parent = resource.getChild("comments");
    if ( parent == null ) {
        %><p>No comments...</p><%
    } else {
        int count = 0;
        for(final Resource c : parent.getChildren()) {
            %><hr/><sling:include resource="<%= c %>" replaceSelectors="item"/><%
            count++;
            if( count >= 10 ) {
                break;
            }
        }
    }
    if ( slingRequest.getAuthType() != null ) {
        %>
        <hr/><p>Leave a comment...</p>
        <form method="POST" action="<%= request.getContextPath() %><%=resource.getName() %>/comments">
        <p>Title: <input name="<%= SlingshotConstants.PROPERTY_TITLE %>"/></p>
        <p>Description: <input name="<%= SlingshotConstants.PROPERTY_DESCRIPTION %>"/></p>
        <button class="ui-button ui-form-button" type="submit">Add</button>
      </form>
      <%
    }
%>
</div>
