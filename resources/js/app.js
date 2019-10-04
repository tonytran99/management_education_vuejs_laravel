require('./bootstrap');

window.Vue = require('vue');
import Vue from 'vue';

import VueRouter from 'vue-router';
Vue.use(VueRouter);

// import VueAxios from 'vue-axios';
// import axios from 'axios';
// Vue.use(VueAxios, axios);

let pathname = window.location.pathname;

if(pathname.indexOf('admin') != -1)
{
	/* Admin Page */

	let Adminheader =  Vue.component('Adminheader', require('./components/admin/layouts/Adminheader.vue').default);
	let Adminfooter =  Vue.component('Adminfooter', require('./components/admin/layouts/Adminfooter.vue').default);
	let Adminhome = Vue.component('Adminhome', require('./components/admin/pages/home/Adminhome.vue').default);
	let Studentmanagement = Vue.component('Studentmanagement', require('./components/admin/pages/student_management/Studentmanagement.vue').default);
	let Modulemanagement = Vue.component('Modulemanagement', require('./components/admin/pages/module_management/Modulemanagement.vue').default);
	let Classmanagement = Vue.component('Classmanagement', require('./components/admin/pages/class_management/Classmanagement.vue').default);

	const routes = [
		{
			path: '/',
			component: Adminhome
		}
		,
		{
			path: '/student-management',
			component: Studentmanagement
		}
		,
		{
			path: '/module-management',
			component: Modulemanagement
		}
		,
		{
			path: '/class-management',
			component: Classmanagement			
		}
	];

	const router = new VueRouter({
		// mode: 'history',
		routes
	});

	const admin = new Vue({
	    el: '#admin',
	    router,
	    components: {Adminheader, Adminfooter}
	});
}

if(pathname.indexOf('student') != -1)
{
	/* Student Page */

	let Studentheader =  Vue.component('Studentheader', require('./components/student/layouts/Studentheader.vue').default);
	let Studentfooter =  Vue.component('Studentfooter', require('./components/student/layouts/Studentfooter.vue').default);
	let Studenthome = Vue.component('Studenthome', require('./components/student/pages/home/Studenthome.vue').default);
	let Studentinformation = Vue.component('Studentinformation', require('./components/student/pages/student_information/Studentinformation.vue').default);
	let Modulemanagement = Vue.component('Modulemanagement', require('./components/student/pages/module_management/Modulemanagement.vue').default);
	let Classmanagement = Vue.component('Classmanagement', require('./components/student/pages/class_management/Classmanagement.vue').default);


	const routes = [
		{
			path: '/',
			component: Studenthome
		}
		,
		{
			path: '/student-information',
			component: Studentinformation
		}
		,
		{
			path: '/module-management',
			component: Modulemanagement
		}
		,
		{
			path: '/class-management',
			component: Classmanagement			
		}
	];

	const router = new VueRouter({
		// mode: 'history',
		routes
	});

	const admin = new Vue({
	    el: '#student',
	    router,
	    components: {Studentheader, Studentfooter}
	});
}







