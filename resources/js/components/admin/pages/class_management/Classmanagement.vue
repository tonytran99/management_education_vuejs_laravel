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
				            <th>Module</th>
				            <th>Room</th>
				            <th>Max Quantity</th>
				            <th>Current Quantity</th>
				            <th>
				            	<span><i class="fa fa-cog"></i></span>
				            </th>
				        </tr>
				        <tr>
				        	<th></th>
				        	<th></th>
				        	<th>
				        		<Classfilterbymodule></Classfilterbymodule>
				        	</th>
				        </tr>
				    </thead>
				    <tbody>
				    	<tr v-for="item, key in data_class_list">
				            <td>{{ key + 1 }}</td>
				            <td>{{ item.class_code }}</td>
				            <td>
				            	<span class="font-weight-bolder">{{(search_module_by_id(item.module_id) != null) ? search_module_by_id(item.module_id).name : ''}}</span><br>
				            	<span class="font-italic">{{(search_module_by_id(item.module_id) != null) ? search_module_by_id(item.module_id).module_code : ''}}</span>
				            </td>
				            <td>{{ item.room }}</td>
				            <td>{{ item.max_quantity }}</td>
				            <td>{{ item.current_quantity }}</td>
				            <td>
				            	<button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#update_modal" @click="openUpdate(key)"><span><i class="fa fa-edit"></i></span></button>
				            	<button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#delete_modal" @click="openDelete(key)"><span><i class="fa fa-trash"></i></span></button>
				            </td>
				        </tr>
				    </tbody>
				</table>
				<Classpagination></Classpagination>
				<Classadd></Classadd>
				<Classdelete></Classdelete>
				<Classupdate></Classupdate>
			</div>
		</div>
	</div>
</template>

<script type="text/javascript">
	let Classfilterbymodule = Vue.component('Classfilterbymodule', require('./Classfilterbymodule.vue').default);
	let Classpagination = Vue.component('Classpagination', require('./Classpagination.vue').default);
	let Classadd = Vue.component('Classadd', require('./Classadd.vue').default);
	let Classdelete = Vue.component('Classdelete', require('./Classdelete.vue').default);
	let Classupdate = Vue.component('Classupdate', require('./Classupdate.vue').default);
	export default {
		components: {Classfilterbymodule, Classpagination, Classadd, Classdelete, Classupdate},
		data(){
			return {
				data_class_list: {
					id: '',
					module_id: '',
					class_code: '',
					room: '',
					max_quantity: '',
					current_quantity: ''
				},
				all_module: {
					id: '',
					name: '',
					module_code: ''
				},
				pagination: {
					current_page: '',
					last_page: ''
				}
			}
		},
		mounted(){
			this.get_all_module()
			this.get_data_class_list()
		},
		methods: {
			get_data_class_list(){
				axios.get(`admin/get_data_class_list?page=${this.pagination.current_page}`)
				.then((response) => {
					this.data_class_list = response.data.data
					this.pagination.current_page = response.data.current_page
					this.pagination.last_page = response.data.last_page
					this.$children[1].pagination = this.pagination
				})
				.catch((error) => {
					console.log(error)
				})
			},
			search_module_by_id(module_id){
				for (var i = 0; i < this.all_module.length; i++) {
			        if (this.all_module[i].id == module_id) {
			            return this.all_module[i];
			        }
			    }
			    return null;
			},
			get_all_module(){
				axios.get('admin/get_all_module')
				.then((response) => {
					this.all_module = response.data
					this.$children[0].all_module = this.all_module
				})
				.catch((error) => {
					console.log(error)
				})
			},
			openAdd(){
				this.$children[2].all_module = this.all_module
			},
			openDelete(key){
				this.$children[3].id = this.data_class_list[key].id
			},
			openUpdate(key){
				this.$children[4].data_class = this.data_class_list[key]
				this.$children[4].all_module = this.all_module
				
				console.log(this.search_module_by_id(this.data_class_list[key].module_id).name)
	            this.$children[4].data_module = this.search_module_by_id(this.data_class_list[key].module_id).name + " - " + this.search_module_by_id(this.data_class_list[key].module_id).module_code
			}


		}
	}
</script>