<%-- Created by IntelliJ IDEA. User: HP Date: 6/19/2022 Time: 6:36 PM To change
this template use File | Settings | File Templates. --%> <%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<section class="h-screen">
    <div class="px-6 h-full text-gray-800">
        <div
                class="flex xl:justify-center lg:justify-between justify-center items-center flex-wrap h-full g-6"
        >
            <div
                    class="grow-0 shrink-1 md:shrink-0 basis-auto xl:w-6/12 lg:w-6/12 md:w-9/12 mb-12 md:mb-0"
            >
                <img
                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                        class="w-full"
                        alt="Sample image"
                />
            </div>
            <div class="xl:ml-20 xl:w-5/12 lg:w-5/12 md:w-8/12 mb-12 md:mb-0">
                <form action="" method="post">
                    <div
                            class="flex flex-row items-center justify-center lg:justify-start pb-8"
                    >
                        <p class="mb-0 mr-4 text-3xl font-bold">Login</p>
                    </div>
                    <!-- Email input -->
                    <div class="mb-6">
                        <input aria-label="email"
                                type="text"
                                class="form-control block w-full px-4 w-80 py-2 text-xl font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                id="email"
                                name="email"
                                placeholder="Email address"
                        />
                    </div>

                    <!-- Password input -->
                    <div class="mb-6">
                        <input aria-label="password"
                                type="password"
                                class="form-control block w-full px-4 w-80 py-2 text-xl font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                id="password"
                                name="password"
                                placeholder="Password"
                        />
                    </div>

                    <div class="text-center lg:text-left">
                        <button
                                type="submit"
                                class="inline-block px-7 py-3 bg-blue-600 text-white font-medium text-sm leading-snug uppercase rounded shadow-md hover:bg-blue-700 hover:shadow-lg focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out"
                        >
                            Login
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>
