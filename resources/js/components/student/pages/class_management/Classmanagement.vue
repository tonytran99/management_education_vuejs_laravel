<template>
	<div id="class_management">
		<div class="row">
			<div class="col-12 text-center mt-2">
				<div class="jumbotron bg-dark">
				  	<span class="font-weight-bolder text-light h3">Class Management</span>
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
				            <th>Class Code</th>
				            <th>Room</th>
				            <th>Max Quantity</th>
				            <th>Current Quantity</th>
				            <th>Module</th>
				            <th>
				            	<span><i class="fa fa-cog"></i></span>
				            </th>
				        </tr>
				    </thead>
				    <tbody>
				        <tr v-for="item, key in data_student_class_list">
				            <td>{{ key + 1 }}</td>
				            <td>{{(search_class_by_id(item.class_id) != null) ? search_class_by_id(item.class_id).class_code : ''}}</td>
				            <td>{{(search_class_by_id(item.class_id) != null) ? search_class_by_id(item.class_id).room : ''}}</td>
				            <td>{{(search_class_by_id(item.class_id) != null) ? search_class_by_id(item.class_id).max_quantity : ''}}</td>
				            <td>{{(search_class_by_id(item.class_id) != null) ? search_class_by_id(item.class_id).current_quantity : ''}}</td>
				            <td>
				            	<span class="font-weight-bolder">{{(search_student_module_by_id(item.student_module_id) != null) ? search_student_module_by_id(item.student_module_id).name : ''}}</span><br>
				            	<span class="font-italic">{{(search_student_module_by_id(item.student_module_id) != null) ? search_student_module_by_id(item.student_module_id).module_code : ''}}</span>
				            </td>
				            <td>
				            	<button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#delete_modal" @click="openDelete(key)"><span><i class="fa fa-trash"></i></span></button>
				            </td>
				        </tr>
				    </tbody>
				</table>
				<Modulepagination></Modulepagination>
				<Classadd></Classadd>
				<Classdelete></Classdelete>
			</div>
		</div>
	</div>
</template>

<script type="text/javascript">
	let Classpagination = Vue.component('Classpagination', require('./Classpagination.vue').default);
	let Classadd = Vue.component('Classadd', require('./Classadd.vue').default);
	let Classdelete = Vue.component('Classdelete', require('./Classdelete.vue').default);

	export default {
		components: {Classpagination, Classadd, Classdelete},
		data(){
			return{
				data_student_class_list: {
					id: '',
					student_module_id: '',
					class_id: ''
				},
				all_student_module: {
					student_module_id: '',
					name: '',
					module_code: '',
				},
				all_class: {
					id: '',
					module_id: '',
					class_code: '',
					room: '',
					max_quantity: '',
					current_quantity: ''
				},
				pagination: {
					current_page: 1,
					last_page: 1
				}
			}
		},
		mounted(){
			this.get_all_student_module()
			this.get_all_class()
			this.get_data_student_class_list()
		},
		methods: {
			search_student_module_by_id(student_module_id){
				for (var i = 0; i < this.all_student_module.length; i++) {
			        if (this.all_student_module[i].student_module_id == student_module_id) {
			            return this.all_student_module[i];
			        }
			    }
			    return null;
			},
			get_all_student_module()
			{
				axios.get('student/get_all_student_module')
				.then((response) => {
					this.all_student_module = response.data
					// console.log(response.data)
				})
				.catch((error) => {
					console.log(error)
				})				
			},
			search_class_by_id(class_id){
				for (var i = 0; i < this.all_class.length; i++) {
			        if (this.all_class[i].id == class_id) {
			            return this.all_class[i];
			        }
			    }
			    return null;
			},
			get_all_class(){
				axios.get('student/get_all_class')
				.then((response) => {
					this.all_class = response.data
				})
				.catch((error) => {
					console.log(error)
				})
			},
			get_data_student_class_list(){
				axios.get(`student/get_data_student_class_list?page=${this.pagination.current_page}`)
				.then((response) => {
					this.data_student_class_list = response.data.data
					this.pagination.current_page = response.data.current_page
					this.pagination.last_page = response.data.last_page
					this.$children[0].pagination = this.pagination
				})
				.catch((error) => {
					console.log(error)
				})
			},
			openAdd(){
				this.$children[1].all_student_module = this.all_student_module
			},
			openDelete(key){
				this.$children[2].id = this.data_student_class_list[key].id
			}
		}
	}
</script>
