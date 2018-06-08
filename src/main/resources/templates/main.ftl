<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<title>Messages List</title>
<body>
<div>
<@l.logout />
    <span><a href="/user">Users list</a></span>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter ? if_exists}">
        <button type="submit">FIND</button>
    </form>
    <form method="post" enctype="multipart/form-data">
        <input type="text" name="text" placeholder="Enter message">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="text" name="tag" placeholder="Enter tag">
        <input type="file" name="file">
        <button type="submit">ADD</button>
    </form>
</div>
<div>
        <table style="text-align: center; width: 50%">
            <tr>
                <th>ID</th>
                <th>TEXT</th>
                <th>TAG</th>
                <th>AUTHOR</th>
                <th>FILE</th>
            </tr>
            <#list messages as message>
            <tr>
            <td>${message.id}</td>
            <td>${message.text}</td>
            <td>${message.tag}</td>
            <td>${message.authorName}</td>
            <td>
                    <div>
                    <#if message.filename??>
                    <img src="/img/${message.filename}">
                    </#if>
                    </div>
            </td>
            </tr>
            <#else>
            No messages
            </#list>
        </table>
</div>
</@c.page>