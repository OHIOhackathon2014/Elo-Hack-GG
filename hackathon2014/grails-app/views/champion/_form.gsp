<%@ page import="hack.Champion" %>



<div class="fieldcontain ${hasErrors(bean: championInstance, field: 'champid', 'error')} required">
	<label for="champid">
		<g:message code="champion.champid.label" default="Champid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="champid" type="number" value="${championInstance.champid}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: championInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="champion.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${championInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: championInstance, field: 'stats', 'error')} ">
	<label for="stats">
		<g:message code="champion.stats.label" default="Stats" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${championInstance?.stats?}" var="s">
    <li><g:link controller="stat" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="stat" action="create" params="['champion.id': championInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'stat.label', default: 'Stat')])}</g:link>
</li>
</ul>


</div>

