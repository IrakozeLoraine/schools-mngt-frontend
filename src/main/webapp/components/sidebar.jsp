<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 6/20/2022
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
<div class="flex  justify-between">
    <div
            class="fixed h-full p-2 w-[300px] overflow-y-auto text-center bg-gray-900"
    >
        <div class="text-gray-100 text-xl">
            <div class="p-2.5 mt-1 flex items-center">
                <i class="bi bi-app-indicator px-2 py-1 rounded-md bg-blue-600"></i>
                <h1 class="font-bold text-gray-200 text-[15px] ml-3">Schools Mis</h1>
            </div>
            <div class="my-2 bg-gray-600 h-[1px]"></div>
        </div>

        <div
                class="p-2.5 mt-3 flex items-center rounded-md px-4 duration-300 cursor-pointer hover:bg-blue-600 text-white"
        >
            <i class="bi bi-house-door-fill"></i>
            <a href="schools" class="text-[15px] ml-4 text-gray-200 font-bold">Schools</a>
        </div>
        <div
                class="p-2.5 mt-3 flex items-center rounded-md px-4 duration-300 cursor-pointer hover:bg-blue-600 text-white"
        >
            <i class="bi bi-bookmark-fill"></i>
            <a href="teachers" class="text-[15px] ml-4 text-gray-200 font-bold">Teachers</a>
        </div>

        <div
                class="p-2.5 mt-3 flex items-center rounded-md px-4 duration-300 cursor-pointer hover:bg-blue-600 text-white"
        >
            <i class="bi bi-box-arrow-in-right"></i>
            <a href="logout" class="text-[15px] ml-4 text-gray-200 font-bold">Logout</a>
        </div>
    </div>
</div>
</body>
</html>