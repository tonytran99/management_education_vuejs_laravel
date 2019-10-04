<template>
	<div id="student_management">
		<div class="row">
			<div class="col-12 text-center mt-2">
				<div class="jumbotron bg-dark">
				  	<span class="font-weight-bolder text-light h3">Student Management</span>
				</div>
			</div>
			<div class="col-12">
				<table class="table">
				    <thead>
				        <tr>
				            <th>#</th>
				            <th>Student Code</th>
				            <th>Name</th>
				            <th><span><i class="fa fa-cog"></i></span></th>
				        </tr>
				    </thead>
				    <tbody>
				        <tr v-for="item, key in data_student_list">
				            <td>{{ key + 1 }}</td>
				            <td>{{ item.student_code }}</td>
				            <td>{{ item.name }}</td>
				            <td>
				            	<button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#detail_modal" @click="student_detail(key)"><span><i class="fa fa-eye"></i></span></button>
				            </td>
				        </tr>
				    </tbody>
				</table>
				<Studentpagination></Studentpagination>
				<Studentdetail></Studentdetail>
			</div>
		</div>
	</div>
</template>
<script type="text/javascript">
	let Studentpagination = Vue.component('Studentpagination', require('./Studentpagination.vue').default);
	let Studentdetail = Vue.component('Studentdetail', require('./Studentdetail.vue').default);
	export default {
		components: {Studentpagination, Studentdetail},
		data (){
			return {
				data_student_list : {
					email: '',
					student_code: '',
					name: '',
					address: '',
					phone: '',
					image: '',
				},
				pagination: {
					current_page: 1,
					last_page: 1
				}
			}
		},
		mounted() {
			this.get_data_student_list()
		},
		methods: {
			get_data_student_list(){
				axios(`admin/get_data_student_list?page=${this.pagination.current_page}`)
				.then((response) => {
					this.data_student_list = response.data.data
					this.pagination.current_page = response.data.current_page
					this.pagination.last_page = response.data.last_page
					this.$children[0].pagination = this.pagination
				})
				.catch((error) => {
					console.log(error)
				})
			},
			student_detail(key){
				this.$children[1].data_student = this.data_student_list[key]
			}
		}
	}
</script>