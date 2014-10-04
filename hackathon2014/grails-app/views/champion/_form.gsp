<%@ page import="hack.Champion" %>



<div class="fieldcontain ${hasErrors(bean: championInstance, field: 'champid', 'error')} required">
	<label for="champid">
		<g:message code="champion.champid.label" default="Champid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="champid" type="number" value="${championInstance.champid}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: championInstance, field: 'stats', 'error')} ">
	<label for="stats">
		<g:message code="champion.stats.label" default="Stats" />
		
	</label>
	<g:select name="stats" from="${hack.Stat.list()}" multiple="multiple" optionKey="id" size="5" value="${championInstance?.stats*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: championInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="champion.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${championInstance?.title}"/>

</div>

