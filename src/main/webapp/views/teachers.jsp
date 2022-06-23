<%@ page import="java.util.Objects" %><%-- Created by IntelliJ IDEA. User: HP Date: 6/19/2022 Time: 7:18 PM To change
this template use File | Settings | File Templates. --%>

<%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Teachers</title>
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
  <div class="bg-white p-8 rounded-md w-full">
    <div class=" flex items-center justify-between pb-6">
      <div>
        <h2 class="text-gray-600 font-semibold">Teachers</h2>
        <span class="text-xs">Total: <c:out value="${teachers.size()}">${teachers.size()}</c:out></span>
      </div>
      <div class="flex items-center justify-between">
        <div class="lg:ml-40 ml-10 space-x-8">
          <a href="new-teacher" class="bg-indigo-600 px-4 py-2 rounded-md text-white font-semibold tracking-wide cursor-pointer">New Teacher</a>
        </div>
      </div>
    </div>
    <div>
      <div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
        <div class="inline-block min-w-full shadow rounded-lg overflow-hidden">
          <table class="min-w-full leading-normal">
            <thead>
            <tr>
              <th
                      class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                Name
              </th>
              <th
                      class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                motto
              </th>
              <th
                      class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                Established on
              </th>
              <%--                                <th--%>
              <%--                                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">--%>
              <%--                                    Performance--%>
              <%--                                </th>--%>
              <th
                      class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                Actions
              </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${teachers}" var="teacher" varStatus="tch">
              <tr>
                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm flex gap-4">
                  <div class="flex gap-4">
                      <span >
                          ${tch.index+1}
                      </span>
                    <span class="text-gray-900 whitespace-no-wrap">
                        ${teacher.names}
                    </span>
                  </div>
                </td>
                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                  <p class="text-gray-900 whitespace-no-wrap">${teacher.degree}</p>
                </td>
                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                  <p class="text-gray-900 whitespace-no-wrap">
                    <c:if test="${teacher.schools.size() == 0}">
                          <span class="mx-2">
                              No school found
                          </span>
                    </c:if>
                    <c:if test="${teacher.schools.size() > 0}">
                      <c:forEach items="${teacher.schools}" var="school">
                        <span class="text-white whitespace-no-wrap bg-gray-600 px-4 py-2 rounded-md mx-2">
                           ${school.name}
                        </span>
                      </c:forEach>
                    </c:if>

                  </p>
                </td>
                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm flex gap-4">
                  <button class="bg-indigo-600 px-2 py-1 rounded-md text-white">
                    View
                  </button>
                  <button class="bg-slate-600 px-2 py-1 rounded-md text-white">
                    Edit
                  </button>
                  <button class="bg-red-600 px-2 py-1 rounded-md text-white">
                    Delete
                  </button>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>

        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
