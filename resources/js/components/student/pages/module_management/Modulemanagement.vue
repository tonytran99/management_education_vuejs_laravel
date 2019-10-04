<template>
	<div id="module_management">
		<div class="row">
			<div class="col-12 text-center mt-2">
				<div class="jumbotron bg-dark">
				  	<span class="font-weight-bolder text-light h3">Module Management</span>
				</div>
			</div>
			<div class="col-8 mb-2">
				
			</div>
			<div class="col-4 mb-2 text-right">
				<button class="btn btn-dark" data-toggle="modal" data-target="#add_modal" @click="openAdd"><span><i class="fa fa-plus"></i></span></button>
			</div>
			<div class="col-12">
				<table class="table">
				    <thead>
				        <tr>
				            <th>#</th>
				            <th>Module Code</th>
				            <th>Name</th>
				            <th>Description</th>
				            <th>
				            	<span><i class="fa fa-cog"></i></span>
				            </th>
				        </tr>
				    </thead>
				    <tbody>
				        <tr v-for="item, key in data_student_module_list">
				            <td>{{ key + 1 }}</td>
				            <td>{{(search_module_by_id(item.module_id) != null) ? search_module_by_id(item.module_id).module_code : ''}}</td>
				            <td>{{(search_module_by_id(item.module_id) != null) ? search_module_by_id(item.module_id).name : ''}}</td>
				            <td>{{(search_module_by_id(item.module_id) != null) ? search_module_by_id(item.module_id).description : ''}}</td>
				            <td>
				            	<button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#delete_modal" @click="openDelete(key)"><span><i class="fa fa-trash"></i></span></button>
				            </td>
				        </tr>
				    </tbody>
				</table>
				<Modulepagination></Modulepagination>
				<Moduleadd></Moduleadd>
				<Moduledelete></Moduledelete>
			</div>
		</div>
	</div>
</template>

<script type="text/javascript">
	let Modulepagination = Vue.component('Modulepagination', require('./Modulepagination.vue').default);
	let Moduleadd = Vue.component('Moduleadd', require('./Moduleadd.vue').default);
	let Moduledelete = Vue.component('Moduledelete', require('./Moduledelete.vue').default);
	export default {
		components: {Modulepagination, Moduleadd, Moduledelete},
		data(){
			return {
				data_student_module_list: {
					id: '',
					module_id: '',
				},
				all_module: {
					id: '',
					name: '',
					module_code: '',
					description: ''
				},
				pagination: {
					current_page: 1,
					last_page: 1
				}
			}
		},
		mounted(){
			this.get_all_module()
			this.get_data_student_module_list()
		},
		methods: {
			search_module_by_id(module_id){
				for (var i = 0; i < this.all_module.length; i++) {
			        if (this.all_module[i].id == module_id) {
			            return this.all_module[i];
			        }
			    }
			    return null;
			},
			get_all_module(){
				axios.get('student/get_all_module')
				.then((response) => {
					this.all_module = response.data
				})
				.catch((error) => {
					console.log(error)
				})
			},
			get_data_student_module_list(){
				axios.get(`student/get_data_student_module_list?page=${this.pagination.current_page}`)
				.then((response) => {
					this.data_student_module_list = response.data.data
					this.pagination.current_page = response.data.current_page
					this.pagination.last_page = response.data.last_page
					this.$children[0].pagination = this.pagination
				})
				.catch((error) => {
					console.log(error)
				})
			},
			openAdd(){
				this.$children[1].all_module = this.all_module
			},
			openDelete(key){
				this.$children[2].id = this.data_student_module_list[key].id
			}
		}
	}
</script>