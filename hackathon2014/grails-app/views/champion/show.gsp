
<%@ page import="hack.Champion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'champion.label', default: 'Champion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-champion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-champion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list champion">
			
				<g:if test="${championInstance?.champid}">
				<li class="fieldcontain">
					<span id="champid-label" class="property-label"><g:message code="champion.champid.label" default="Champid" /></span>
					
						<span class="property-value" aria-labelledby="champid-label"><g:fieldValue bean="${championInstance}" field="champid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${championInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="champion.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${championInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${championInstance?.stats}">
				<li class="fieldcontain">
					<span id="stats-label" class="property-label"><g:message code="champion.stats.label" default="Stats" /></span>
					
						<g:each in="${championInstance.stats}" var="s">
						<span class="property-value" aria-labelledby="stats-label"><g:link controller="stat" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:championInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${championInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
