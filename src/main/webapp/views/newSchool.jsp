<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 6/20/2022
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>New School</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="flex justify-between">
    <!-- sidebar here -->
    <jsp:include page="../components/sidebar.jsp">
        <jsp:param name="activeLink" value="schools"/>
    </jsp:include>

    <!-- navbar here -->
    <jsp:include page="../components/navbar.jsp"/>
</div>
<div class="ml-[300px] pl-4">
    <div class="max-w-lg flex-1 flex flex-col px-2 my-12 ml-12">
        <form method="post" action="/save-school">
            <h1 class="mb-8 text-3xl">New School</h1>
            <input
                    class="block border border-grey-light w-full p-3 rounded mb-4"
                    name="name"
                    placeholder="School Name" />

            <input
                    class="block border border-grey-light w-full p-3 rounded mb-4"
                    name="school_motto"
                    placeholder="School moto" />

            <input
                    type="date"
                    class="block border border-grey-light w-full p-3 rounded mb-4"
                    name="established_on"
                    placeholder="Established on" />

            <button
                    type="submit"
                    class="w-full text-center py-3 rounded bg-indigo-600 text-white hover:bg-green-dark focus:outline-none my-1"
            >Create School</button>
        </form>
    </div>
</div>
</body>
</html>
