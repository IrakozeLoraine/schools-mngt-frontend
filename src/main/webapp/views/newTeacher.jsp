<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>New Teacher</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="flex justify-between">
    <!-- sidebar here -->
    <jsp:include page="../components/sidebar.jsp">
        <jsp:param name="activeLink" value="teachers"/>
    </jsp:include>

    <!-- navbar here -->
    <jsp:include page="../components/navbar.jsp"/>
</div>
<div class="ml-[300px] pl-4">
    <div class="max-w-lg flex-1 flex flex-col px-2 my-12 ml-12">
        <form method="post" action="/save-teacher">
            <h1 class="mb-8 text-3xl">New Teacher</h1>
            <input
                    class="block border border-grey-light w-full p-3 rounded mb-4"
                    name="name"
                    placeholder="Teacher's Names" />

            <label for="degrees" class="block mb-2 text-sm font-medium text-gray-900">Select degree</label>
            <select id="degrees" name="degree" class="bg-gray-50 border w-full border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block p-2.5 h- pr-2.5  mb-4">
                <option selected>Choose a degree</option>
                <c:forEach items="${degrees}" var="degree">
                    <option value="${degree}">${degree}</option>
                </c:forEach>
            </select>

            <label for="degrees" class="block mb-2 text-sm font-medium text-gray-900">Select school</label>
            <select id="schools" name="school_id" class="bg-gray-50 border w-full border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block p-2.5 h- pr-2.5  mb-4">
                <option selected>Choose a school</option>
                <c:forEach items="${schools}" var="school">
                    <option value="${school.id}">${school.name}</option>
                </c:forEach>
            </select>


            <button
                    type="submit"
                    class="w-full text-center py-3 rounded bg-indigo-600 text-white hover:bg-green-dark focus:outline-none my-1"
            >Add Teacher</button>
        </form>
    </div>
</div>
</body>
</html>
