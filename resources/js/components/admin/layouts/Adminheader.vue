<template>
	<div id="admin_header">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		    <router-link to="/" class="navbar-brand"><img src="uploads/logo.png" style="width: 40px;"></router-link>
		    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#nav">
		        <span class="navbar-toggler-icon"></span>
		    </button>

		    <div class="collapse navbar-collapse" id="nav">
		        <ul class="navbar-nav mr-auto font-weight-bolder">
		            <li class="nav-item">
		                <router-link to="/student-management" class="nav-link">Student Management</router-link>
		            </li>
		            <li class="nav-item">
		                <router-link to="/module-management" class="nav-link">Module Management</router-link>
		            </li>
		            <li class="nav-item">
		                <router-link to="/class-management" class="nav-link">Class Management</router-link>
		            </li>
		        </ul>
		        <ul class="navbar-nav font-weight-bolder">
		            <li class="nav-item">
		                <a href="logout" class="nav-link text-light"><span><i class="fa fa-sign-out"></i></span> Logout</a>
		            </li>
		        </ul>
		    </div>
		</nav>
	</div>
</template>